
#"Ninety-nine bottles of beer..."
# Using englishNumber and your old program, write out the lyrics to this song
# the right way this time. Punish your computer: have it start at 9999. (Don't
# pick a number too large, though, because writing all of that to the screen
# takes your computer quite a while. A hundred thousand bottles of beer takes
# some time; and if you pick a million, you'll be punishing yourself as well!

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
        numString = numString + englishNumber(write) + ' ' + label[1]

        # If there's something left, we process and clean it.
        if left > 0
          numString = numString + ' ' + englishNumber(left)
          left      = 0
        end
      end
    end

  else
    # If the number is small (99 or below), we call the smallEnglishNumber
    # function to handle it.
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

def bottlesOfBeer bottles
  while bottles >= 0
    start_number = bottles

    if bottles > 1
      # Rime for more than 1 bottle
      puts englishNumber(bottles).capitalize + " bottles of beer on the wall," +
           " " + englishNumber(bottles) + " bottles of beer."

      if bottles == 2
        # Edge case: going from 2 bottles to 1 bottle
        puts "Take one down, pass it around, one bottle of beer on the wall..."
      else
        puts "Take one down, pass it around, " +
             englishNumber(bottles) + " bottles of beer on the wall..."
      end
    else
      # Rimes for 1 bottle and 0 bottles
      if bottles == 1
        puts "One bottle of beer on the wall, just one bottle of beer."
        puts "If that one bottle should happen to fall," +
             " what a waste of alcohol!"
      else
        puts "No more bottles of beer on the wall, no more bottles of beer."
        puts "Go to the store and buy some more, " +
             englishNumber(start_number) + " bottles of beer on the wall."
      end
    end

    bottles = bottles - 1
  end
end

bottlesOfBeer 9999

__END__

Part of the code for this program is based on the example given by Chris Pine in his
tutorial.
