
# Expand upon englishNumber some more. Now put in millions, so you get 'one
# million' instead of 'one thousand thousand'. Then try adding billions and
# trillions. How high can you go?

def englishNumber number
  if number < 0  #  No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  numString = ''  #  This is the string we will return.

  # Section for numbers starting from 100 and above ###########################

  # If number is below 100, we do not jump here
  if number > 99

    # An array of arrays to map labels from hundreds to... whatever you want.
    # Each inner array is a pair of a number written in exponential notation
    # (1e2 is the same that 1 followed by two zeros or 100) and the name that
    # corresponds to its magnitude. Whit this, more magnitudes can be easily
    # added. to_i is used to work with integers only.

    labels = [
      [1e12.to_i, 'trillion'], [1e9.to_i, 'billion'], [1e6.to_i, 'million'],
      [1e3.to_i, 'thousand'], [1e2.to_i, 'hundred']
    ]

    # "left" is how much of the number we still have left to write out.
    # "write" is the part we are writing out right now.
    # write and left... get it?  :)

    left = number

    # Starting from the highest magnitude in "labels", each one is tested to
    # see if its label can be written.

    labels.each do | label |
      if left / label[0] > 0
        # We get the part we are going to write...
        write = left / label[0]
        # ...and we remove it from from the remaining
        left  = left - write * label[0]

        # We make a recursive call for the part to be written and we append the
        # magnitude label to it, so we can handle "999 trillions" and the like.
        numString = numString + englishNumber(write) + ' ' + label[1]

        # If there's something left, we process and clean it.
        if left > 0
          numString = numString + ' ' + englishNumber(left)
          left      = 0
        end
      end
    end
  else
  # Section for numbers menores a 100 ########################################
    # smallEnglishNumber is called to handle these numbers
    numString = numString + smallEnglishNumber(number)
  end

  # Now we just return "numString"...
  numString
end


# This method will only handle the numbers below 100, so we'll have a less
# messy code, don't we? :)
def smallEnglishNumber number

  numString = ''  # This is the string we will return.

  # Arrays to map numbers from 1 to 99
  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # Tens section ##############################################################

  left  = number
  write = left / 10       # How many tens left to write out?
  left  = left - write*10 # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left - 1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write - 1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  # Ones section ##############################################################

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write - 1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

puts englishNumber(  0)
puts englishNumber(  9)
puts englishNumber( 10)
puts englishNumber( 11)
puts englishNumber( 17)
puts englishNumber( 32)
puts englishNumber( 88)
puts englishNumber( 99)
puts englishNumber(100)
puts englishNumber(101)
puts englishNumber(234)
puts englishNumber(3211)
puts englishNumber(999999)
puts englishNumber(1000000000000)

__END__

The code for this program is based on the example given by Chris Pine in his
tutorial.
