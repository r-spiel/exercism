=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
class Luhn

  def self.digit_transform(digit)
    if (digit * 2) > 9
      return ((digit * 2) - 9)
    else
      return digit * 2
    end
  end

  def self.valid?(string)
    string.gsub!(" ", "")
    return false if string.length <= 1
    # unless digit or space return false, & take out valid white space
    array = []

    string.each_char.with_index do |char| #O(n)
      digit = /[\d]/
      if !digit.match(char)
        return false
      else
        array << char.to_i
      end
    end

    index = array.length - 1
    odd = 0 # don't start with first iteration, start w/ second
    sum = 0
    while index >= 0 # O(n)
      if odd.odd?
        array[index] = digit_transform(array[index])
      end
      sum += array[index]

      index -= 1
      odd += 1
    end

    if sum % 10 == 0
      return true
    else
      return false
    end
  end
end
