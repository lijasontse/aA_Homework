class Queue

    def initialize
        @queue_arr = []
    end

    def queue_arr
        @queue_arr
    end

    def enqueue(el)
        queue_arr << el
    end

    def dequeue
        queue_arr.shift
    end

    def peek
        queue_arr.first 
    end

end