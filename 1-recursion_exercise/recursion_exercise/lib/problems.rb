# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is always positive.
#
# Solve this recursively!
#
# Examples:
#
# pow(2, 0) # => 1
# pow(2, 1) # => 2
# pow(2, 5) # => 32
# pow(3, 4) # => 81
# pow(4, 3) # => 64  pow(2,0)=1, pow(2,1)=2, pow(2,2)=4, pow(2,3)=8, pow(2,4)=16, pow(2,5)=32, pow(2,6)=64, pow(2,7)=128, pow(2,8)=256, pow(2,9)=512, pow(2,10)=1024, pow(2,11)=2048, pow(2,12)=4096, pow(2,13)=8192, pow(2,14)=16384, pow(2,15)=32768, pow(2,16)=65536, pow(2,17)=131072, pow(2,18)=262144, pow(2,19)=524288, pow(2,20)=1048576, pow(2,21)=2097152, pow(2,22)=4194304, pow(2,23)=8388608, pow(2,24)=16777216, pow(2,25)=33554432, pow(2,26)=67108864, pow(2,27)=134217728, pow(2,28)=268435456, pow(2,29)=536870912, pow(2,30)=1073741824, pow(2,31)=2147483648, pow(2,32)=4294967296, pow(2,33)=8589934592, pow(2,34)=17179869184, pow(2,35)=34359738368, pow(2,36)=68719476736, pow(2,37)=137438953472, pow(2,38)=274877906944, pow(2,39)=549755813888, pow(2,40)=1099511627776, pow(2,41)=2199023255552, pow(2,42)=4398046511104, pow(2,43)=8796093022208, pow(2,44)=17592186044416, pow(2,45)=35184372088832, pow(2,46)=70368744177664, pow(2,47)=140737488355328, pow(2,48)=281474976710656, pow(2,49)=56294
def pow(base, exponent) #
  return 1 if exponent == 0
    base * pow(base, exponent - 1)
end
# -----------------------------------------------------------------


# Write a method, lucas_number(n), that takes in a number.
# The method should return the n-th number of the Lucas Sequence.
# The 0-th number of the Lucas Sequence is 2.
# The 1-st number of the Lucas Sequence is 1
# To generate the next number of the sequence, we add up the previous two numbers.
#
# For example, the sequence begins: 2, 1, 3, 4, 7, 11, ...
#
# Solve this recursively!
#
# Examples:
#
# lucas_number(0)   # =>    2
# lucas_number(1)   # =>    1
# lucas_number(2)   # =>    3
# lucas_number(3)   # =>    4
# lucas_number(5)   # =>    11
# lucas_number(9)   # =>    76

def lucas_number(n)
return 2 if n == 0
return 1 if n == 1
    lucas_number(n - 1) + lucas_number(n - 2)
     
end


# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
# 
# Solve this recursively!
#
# Examples:
#
# sum_array([])             # => 0
# sum_array([5])            # => 5
# sum_array([5, 2])         # => 7
# sum_array([4, 10, -1, 2]) # => 15
def sum_array(array)
    return 0 if array.empty?
    first = array[0]
    rest = array[1..-1]
    first + sum_array(rest)

end


# Write a method, reverse_string(str), that takes in a string.
# The method should return the string with it's characters in reverse order.
#
# Solve this recursively!
#
# Examples:
# 
# reverse_string("")            # => ""
# reverse_string("c")           # => "c"
# reverse_string("internet")    # => "tenretni"
# reverse_string("friends")     # => "sdneirf"
def reverse_string(str)
 return "" if str == ""

 str[-1] + reverse_string(str[0...-1])
end


# A 1-dimensional array is also known as a flattened array.
# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.
#   
# Hint:
#  - if the argument is not an array, then we have reached the base case
#  - look up the documentation for how to check if data is an array or not
#
# Examples:
#
# array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
# flatten(array_1)      # => [ 1, 2, 3, 4, 5, 6, 7, 8 ]
#
# array_2 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
# flatten(array_2)      # => [ 'this', 'problem', 'is', 'pretty', 'tough', ':)' ]
#
# flatten('base case')  # => [ 'base case' ]
#
# Another Hint:
#
# From the last example, you may be confused. We said that the method takes
# in an array as an arg, but we passed it a string?
# If data is not an array, then we can consider it as a 0-dimensional array.
#     0-dimensional array: 'some data'
#     1-dimensional array: ['some data']
#     2-dimensional array: [['some data']]
#     3-dimensional array: [[['some data']]]
def flatten(data)                      #[1, 2, [[3, 4], [5, [6]]], [7, 8]]
    return [data] if !data.is_a?(Array)

    arr = [] 
    data.each do |element|            #element = [[3, 4], [5, [6]]]
        arr += flatten(element)      #arr = [1, 2, 3, 4, 5, 6]
    end
    arr                             # => [1, 2, 3, 4, 5, 6, 7, 8]
end
