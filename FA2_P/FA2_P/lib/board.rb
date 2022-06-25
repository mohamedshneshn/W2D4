class Board
    def self.build_stacks(number)   # 
        Array.new(number){Array.new(0)}   # create an array of arrays of length 0 
      end

      def initialize (num_stacks,max_height)
           @max_height= max_height                  # @max_height is an instance variable
           @stacks = Board.build_stacks(num_stacks) # @stacks is an instance variable and is 2D array
           if num_stacks < 4 || max_height < 4      # if either num_stacks or max_height is less than 4
               raise "rows and cols must be >= 4"   # raise the error
           end
      end

      def max_height                             # getter method for @max_height
        @max_height
      end
      def add (token, stack_index)              # add method accepts a token and a stack index as args
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index].push(token)
            true
        else
            false
        end
    end
    def vertical_winner?(token) # method to check if there is a vertical winner
        @stacks.each do |stack|
            if stack.length == @max_height && stack.all? {|col| col == token}     
                return true
            end
        end 
        false
    end
    def horizontal_winner?(token) # method to check if there is a horizontal winner
        @stacks.each_with_index do |stack , i|
            if @stacks.length == @max_height  && stack.include?(token) 
                return true
            end
        end
        false
      
    end
   
    def winner?(token) # method to check if there is a winner
        if vertical_winner?(token) || horizontal_winner?(token)
            return true
        else
            return false
        end
    end
    





   


    

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
