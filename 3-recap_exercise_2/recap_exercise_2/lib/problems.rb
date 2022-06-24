# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(n1, n2) #(4,10) 4=4 8 12 16 20 24 28 32 10=10 20 30 40 50 
  
(1..n1*n2).each { |i| return i if i % n1 == 0 && i % n2 == 0 }

end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str) #("gotothemoonsoonforproof")).to eq("oo")
    hash=Hash.new(0)
    (0...str.length-1).each do |i|
        hash[str[i]+str[i+1]]+=1
    end
    # max=hash.values.max
    # hash.each do |k,v|
    #     if v == max
    #         return k
    #     end
    # end
    hash.sort_by {|k,v| v}.last[0]

end

# -----------------------------------------------------
class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash={}
        self.each do |k,v|
            new_hash[v]=k
        end
     new_hash
    end
end

# ----------------------------------------------------------
class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num) #([10, 3, 6, 5, 7].pair_sum_count(13)).to eq(2)
     count=0
     self.each_with_index do |ele1,i|
        self.each_with_index do |ele2,j|
            count+=1  if j > i && (ele1+ele2 == num) 
          end
       end
count
end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
         prc ||=Proc.new{|a, b| a<=> b} #if no proc is given, it will sort in increasing order
        sorted=false
        while !sorted
            sorted=true
            (0...self.length-1).each do |i|
                if prc.call(self[i],self[i+1]) == 1 
                    self[i],self[i+1]=self[i+1],self[i]
                    sorted=false
                end
            end
            
        end
        self
    end
end
