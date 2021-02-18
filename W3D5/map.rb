class Map

    def set(key, value)
    end

    def get(key)
    end

    def delete(key)
    end

    def show
    end
end

class Map
    attr_reader :map
    
        def initialize
            @map = []
        end
    
        def set(k, v) 
            if self.map.flatten.include?(k) 
                    @map.each.with_index do |ele, i|
                      @map[i][1] = v if  ele[0] == k
                    end
            else
                @map << [k, v]
            end
        end
       
        def get_value(k) 
            @map.each.with_index do |ele, i|
                return @map[i][1] if  ele[0] == k
              end
              false
        end
        
        def delete(k)
            @map.each.with_index do |ele, i|
            @map.delete(@map[i]) if  ele[0] == k
            end       
        end
    
        def show
            @map.each do |row|
                puts row.join(' : ')
            end
        end
    
    end