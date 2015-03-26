module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct

  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # instead of checking the last digit,
    # check if the weighted sum of the digits is a multiple of 10
    nums_a.reverse.zip([1, 2].cycle).reduce(0) do |sum, pair|
      sum + pair.reduce(:*).divmod(10).reduce(:+)
    end % 10 == 0
  end

  def validate_checksum_second
    # instead of checking the last digit,
    # check if the weighted sum of the digits is a multiple of 10
    switch  = 1
    sum = 0
    array = (0...5).map{|x| 2*x} + (0...5).map{|x| 2*x+1}
    num = number.reverse.chars.map(&:to_i)
    num.each do |x|
      sum+=((switch^=1)==1)?array[x]:x
    end
    sum%10==0
  end

end
