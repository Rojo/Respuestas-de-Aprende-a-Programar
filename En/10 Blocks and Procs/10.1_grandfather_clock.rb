
# Grandfather Clock.
# Write a method which takes a block and calls it once for each hour that has
# passed today. That way, if I were to pass in the block do puts 'DONG!' end, it
# would chime (sort of) like a grandfather clock. Test your method out with a
# few different blocks (including the one I just gave you).
# Hint: You can use Time.now.hour to get the current hour. However, this returns
# a number between 0 and 23, so you will have to alter those numbers in order to
# get ordinary clock-face numbers (1 to 12).

def clock &block
  hour = Time.now.hour

  # Turn the current hour into a 12 hour clock face equivalent
  if hour == 0
    hour = 12
  elsif hour > 12
    hour = hour % 12
  end

  hour.times do | n |
  # Pass each hour number into the block (so it ma use it if needed) adding 1
  # cause .times starts counting from 0.
    yield n + 1
  end
end

# Passing to clock a block that prints "BONG!" when called.
clock do
  print "BONG! "
end

puts

# Passing to clock a block that prints the content of a given "n" when called.
clock do | n |
  print n.to_s + " "
end

puts

# Passing to clock a block that adds to a counter all the digits from the hours
# that have passed so far in a clock face (from 1 to 12)
@counter = 0
clock do | n |
  @counter = @counter + n
end

puts @counter
