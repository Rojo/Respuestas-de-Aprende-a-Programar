
# Happy Birthday!
# Ask what year a person was born in, then the month, then the day. Figure out
# how old they are and give them a big SPANK! for each birthday they have had.

puts  "Hello! Let me do the math to know how old are you."
print "In what year were you born? "
year  = gets.chomp.to_i
print "In which month? (1 to 12): "
month = gets.chomp.to_i
print "What day was it? (1 to 31): "
day   = gets.chomp.to_i

birth = Time.new(year, month, day)
age   = (Time.now - birth) / 31536000 # Seconds in a year.

puts "So, are you " + age.to_i.to_s + "? Then let's have some traditional fun!"
puts "*gets you bent, over my knees* "

age.to_i.times do
  print "SPANK! "
end

puts
puts "It was fun, wasn't it? Some traditions should not die. :)"
