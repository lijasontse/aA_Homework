require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play

  attr_accessor :title, :year, :playwright_id

  def self.all
    # show us every entry we have in our play databse 
    #pull all our information out 
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    # we want that one instance we have, b/c of singleton module
    data.map { |datum| Play.new(datum) }
    # implement ORM aspect - we want to return an array of play class instance
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ? 
    SQL
    return nil unless play.length > 0 
    Play.new(play.first)
  end

  def self.find_by_playwright(name)
    playwright = PlayDBConnection.find_by
  end

  def initialize(options)
    # create a new instance of the Play class
    # passing in an options hash 
    # what will not be defined is our id, id is defined by our table
    @id = options['id'] # will either be defined, where the id is known because its coming from the class method self.all or user can be creating new instance so nil 
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    # save instance to database
    # want user to be able to call create on the instance of the create class and save that play to our database
    # want to make sure to not add an instance that is already there 
    # if its in our database, we will have the @id defined
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id) 
      INSERT INTO 
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    # ? ? ? prevents from SQL injection attacks 
    @id = PlayDBConnection.instance.last_insert_row_id 
    # last_insert_row_id is a built in sqlite3 gem 
  end

  def update
    # update information in our table
    raise "#{self} not in database" unless @id # shouldnt be calling update if the id does not exist in database
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays 
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ? 
    SQL
  end
end

class Playwright

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwright")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    person = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ? 
    SQL
    return nil unless person.length > 0 

    Playwright.new(person.first) 
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id 
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id 
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ? 
      WHERE
        id = ? 
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless @id
    plays = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ? 
    SQL
    plays.map { |play| Play.new(play) }
  end
end