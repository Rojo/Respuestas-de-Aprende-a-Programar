
# How about weddingNumber? It should work almost the same as englishNumber,
# except that it should insert the word "and" all over the place, returning
# things like 'nineteen hundred and seventy and two', or however wedding
# invitations are supposed to look. I'd give you more examples, but I don't
# fully understand it myself. You might need to contact a wedding coordinator
# to help you.

# References ##################################################################

# The only reference I could find about that way of writting numbers, was the
# first paragraph of the numbers section of the article that compends
# differencer between American and British English: http://goo.gl/pD0edP
#
# So, the goal of the program is to write the conjunction "and" before the tens
# and units, as in "one hundred and sixty-two" or "two thousand and three".

# weddingNumber will act just as a messenger to englishNumber, passing the
# number and setting the initial value for pre_text.
def weddingNumber number
  # We start setting pre_text to false because we have no text yet.
  englishNumber number, false
end

# englishNumber has one new parameter: pre_text. It will indicate if we have
# some text already written to use the "and" conjunction on smallEnglishText.
def englishNumber number, pre_text
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  numString = ''  # This is the string we will return.
  
  # Section for numbers starting from 100 and above ###########################

  # If number is below 100, we do not jump here
  if number > 99

    # An array of arrays to map labels from hundreds to... whatever you want.
    # Each inner array is a pair of a number written in exponential notation
    # (1e2 is the same that 1 followed by two zeros or 100) and the name that
    # corresponds to its magnitude. Whit this, more magnitudes can be easily
    # added. to_i is used to work with integers only.

    labels    = [
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
        # pre_text doesn't chage its value.
        numString = numString + englishNumber(write, pre_text) + ' ' + label[1]

        # If there's something left, we process and clean it, changing the
        # pre_text value to get append the desired "and" conjunction.
        if left > 0
          numString = numString + ' ' + englishNumber(left, true)
          left      = 0
        end
      end
    end
  else
    # If the number is small (99 or below), we call the smallEnglishNumber
    # function to handle it.
    # pre_text doesn't chage its value.
    numString = numString + smallEnglishNumber(number, pre_text)
  end

  # Now we just return "numString"...
  numString
end

# Handles numbers from 1 to 99.
# If pre_text is true, it will pre-prend the "and" conjunction to numString.
def smallEnglishNumber number, pre_text

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
      # Since we can't write "tenty and two" instead of "twelve",
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
      # So we write 'sixty and four'...
      numString = numString + ' and '
    end
  end
  
  # Ones section ##############################################################

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.
  
  if write > 0
    numString = numString + onesPlace[write - 1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end
  
  # Here we check if there is some string already written. If it is, we prepend
  # an "and " to make it more formal (?).
  if pre_text
    numString = 'and ' + numString
  end

  # Now we just return "numString"...
  numString
end

puts weddingNumber(  0)
puts weddingNumber(  9)
puts weddingNumber( 10)
puts weddingNumber( 11)
puts weddingNumber( 17)
puts weddingNumber( 32)
puts weddingNumber( 88)
puts weddingNumber( 99)
puts weddingNumber(100)
puts weddingNumber(101)
puts weddingNumber(234)
puts weddingNumber(3211)
puts weddingNumber(999999)
puts weddingNumber(1000000000000)
