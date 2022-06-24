# General Problems
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array 
# containing the elements that were not repeated in the array.
  
 def no_dupes?(arr)
       
        hash=Hash.new(0)
        arr.each {|ele| hash[ele]+=1 }
        hash.keys.select {|k| hash[k]==1}
        
    end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []
# -----------------------------------------------------------------------

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
#  The method should return true if an element never appears consecutively in the array;
#  it should return false otherwise.
def no_consecutive_repeats?(arr)
 (0...arr.length-1).each { |i| return false if arr[i] == arr[i+1] }
 true
end
# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

# ---------------------------------------------------------------------------------
# Write a method char_indices(str) that takes in a string as an arg. The method 
# should return a hash containing characters as keys. The value associated with each key 
# should be an array containing the indices where
#  that character is found.
def char_indices(str)
   hash=Hash.new{|h,k| h[k]=[]} 
   str.each_char.with_index {|char,i| hash[char] << i }
   hash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}

# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# ------------------------------------------------------------------------
# current_streak = ''
#     best_streak = ''

#     (0...str.length).each do |idx|
#         if str[idx] == str[idx - 1] || idx == 0
#             current_streak += str[idx]
#         else
#             current_streak = str[idx]
#         end

#         best_streak = current_streak if current_streak.length >= best_streak.length
#     end

#     best_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method 
# should return the longest streak of consecutive characters in the string. If there are any
#  ties, return the streak that occurs 
# later in the string.
def longest_streak(str)    #'aaaxyyyyyzz'
    hash=Hash.new(0)
    newStr=""
    (0...str.length-1).each do |i|
        if str[i] == str[i+1]
            hash[str[i]]+=1
        end
    end
    if hash.length == 0
        return str
    else
    max=hash.values.max 
    hash.each do |k,v|
        if v==max
            newStr=k
        end
    end
    return newStr*(max+1)
end
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
# -----------------------------------------------------------------------------
# Write a method bi_prime?(num) that accepts a number as an arg and
#  returns a boolean indicating whether or not the number is a bi-prime. 
#  A bi-prime is a positive integer that can be
#  obtained by multiplying two prime numbers.
def bi_prime?(num) #14
    prime_facts = prime_factors(num) #[2, 7]
    
    prime_facts.any? do |a|
        b = num / a    #b=14/2=7
        prime_facts.include?(b)
    end
end

def prime?(num) 
    return false if num < 2
    (2...num).none? { |i| num % i == 0}
end

def prime_factors(num) #num=14  factors=[1,2, 7, 14]  
    (2..num).select { |i| num % i == 0 && prime?(i) }  # => [2, 7]
end

# p bi_prime?(14)   # => true #2*7
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false
# ----------------------------------------------------------------------------------
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by
#  a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.
# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys
#  is used. For example, if we encrypt "bananasinpajamas" with the key sequence [1, 2, 3],
#   then the result would be "ccqbpdtkqqcmbodt":
# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string 
# and a key-sequence as args, returning the encrypted message. Assume that 
# the message consists
#  of only lowercase alphabetic characters.

def vigenere_cipher(message, keys) #message="bananasinpajamas"  keys=[1, 2, 3] 
    newStr=""
    alpha="abcdefghijklmnopqrstuvwxyz"
    message.each_char.with_index do |char, i|
        shiftIndex= keys[i % keys.length]
         newIndex= alpha.index(char) + shiftIndex
        newStr+=alpha[newIndex%26]
    end
    newStr
end
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
# ----------------------------------------------------------------------------------
 # new_str = str[0..-1]
    # vowels = 'aeiou'

    # vowel_idxs = (0...str.length).select { |i| vowels.include?(str[i]) }
    # rotated_vowel_idxs = vowel_idxs.rotate(-1)

    # vowel_idxs.each_with_index do |vowel_idx, i|
    #     new_vowel = str[rotated_vowel_idxs[i]]
    #     new_str[vowel_idx] = new_vowel
    # end

    # new_str
# Write a method vowel_rotate(str) that accepts a string as an arg and 
# returns the string where every vowel is replaced with the vowel that appears 
# before it sequentially in the original string. The first vowel of the string
#  should be replaced with the last vowel.
def vowel_rotate(str) #computer
     vowels = 'aeiou'
    newStr = str[0..-1] #computer
     indices=vowel_indcies(str) # [1,4,6]
        indices.each_with_index do |idx, i|
          
            newStr[idx]=str[indices[i-1]]
            #str[1]=str[6]
            #str[4]=str[1]
            #str[6]=str[4]

        end 
        newStr
end
def vowel_indcies(str) #computer
    vowels = 'aeiou'
    (0...str.length).select { |i| vowels.include?(str[i]) } # => [1,4,6]
end
# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
# ----------------------------------------------------------------------
# Proc Problems
# Extend the string class by defining a String#select method th
# at accepts a block. The method should return a new string containing 
# characters of the original string that return true when passed into the block.
#  If no block is passed, then return the empty string. Do not use
#  the built-in Array#select in your solution.

class String
    def select(&prc)
        return "" if prc.nil?

        newStr = ""

        self.each_char do |char|
            newStr += char if prc.call(char)
        end

        newStr
        
    end
    p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    p "HELLOworld".select          # => ""
    # ----------------------------------------------------------------------
    # 
    # Extend the string class by defining a String#map! method that accepts a block. 
    # The method should modify the existing string by replacing every character with the
    #  result of calling the block, passing in the original character and it's index.
    #   Do not use the built-in Array#map or 
    # Array#map! in your solution.
    def map!(&prc)
            self.each_char.with_index do |char, idx|
                self[idx] = prc.call(char, idx)
            end
        end
end

# Recursion Problems

def multiply(a, b)
    return 0 if b == 0

    if b < 0
        -(a + multiply(a, (-b) - 1))
    else
        a + multiply(a, b - 1)
    end
end


def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2

    seq = lucas_sequence(n - 1)
    seq << seq[-1] + seq[-2]
    seq
end


def prime_factorization(num)
    (2...num).each do |fact|
        if (num % fact == 0)
            otherFact = num / fact
            return [ *prime_factorization(fact), *prime_factorization(otherFact) ]
        end
    end

    [num]
end

