
# Make an OrangeTree class.
# It should have a height method which returns its height, and a oneYearPasses
# method, which, when called, ages the tree one year. Each year the tree grows
# taller (however much you think an orange tree should grow in a year), and
# after some number of years (again, your call) the tree should die. For the
# first few years, it should not produce fruit, but after a while it should,
# and I guess that older trees produce more each year than younger trees...
# whatever you think makes most sense. And, of course, you should be able to
# countTheOranges (which returns the number of oranges on the tree), and
# pickAnOrange (which reduces the @orangeCount by one and returns a string
# telling you how delicious the orange was, or else it just tells you that
# there are no more oranges to pick this year). Make sure that any oranges you
# don't pick one year fall off before the next year.

class OrangeTree

  def initialize(max_age, max_height)
    # So the tree lives a fixed number of years and grows tall up to a fixed
    # ammount of centimeters.
    @max_age    = max_age
    @max_height = max_height

    # Stats when the tree sprouts.
    @age           = 0
    @height        = 0
    @orangeCount   = 0 # Oranges available this year
    @lastYearCount = 0 # Oranges available the last year
  end

  def oneYearPasses
    if @age == @max_age
      puts "Your tree slowly whitered away... Now it's just wood."
      @orangeCount = 0
    else
      @age = @age + 1
      # Now, let it grow in a somewhat random way
      @height  = @height + rand(@max_height / @max_age + 1)
      # ...and increase the number of oranges available this year over the ones
      # available the last year, but only if the tree has an age bigger than 2.
      @orangeCount   = @lastYearCount + (rand 7) if @age > 2
      @lastYearCount = @orangeCount
    end
  end

  def height
    return @height
  end

  def countTheOranges
    return @orangeCount
  end

  def pickAnOrange
    if @orangeCount > 0
      @orangeCount = @orangeCount - 1
    else
      0
    end
  end
end

# Ok, the OrangeTree class is ready. The following code is just for do
# non-formal tests on how it works.

# Setting a couple of constants for organge trees.
MAX_AGE    = 70   # years
MAX_HEIGHT = 1500 # centimeters

puts "1) The tree can be created, and the new sprout has 0 height and oranges: "
puts "A new tree sprouts!"
tree = OrangeTree.new(MAX_AGE, MAX_HEIGHT)
puts "Tree height: " + tree.height.to_s # >> 0
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> 0
puts

puts "2) The tree grows a little every year:"
puts "Tree height: " + tree.height.to_s # >> 0
puts "A year passes..."
tree.oneYearPasses
puts "Tree height: " + tree.height.to_s # >> n > 0
puts "A year passes..."
tree.oneYearPasses
puts "Tree height: " + tree.height.to_s # >> m > n
puts "A year passes..."
tree.oneYearPasses
puts "Tree height: " + tree.height.to_s # >> o > m
puts 

puts "3) The tree yields more oranges every year but 0 the first 3 years:"
puts "A new tree sprouts!"
tree = OrangeTree.new(MAX_AGE, MAX_HEIGHT)
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> 0
puts "A year passes..."
tree.oneYearPasses
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> 0
puts "A year passes..."
tree.oneYearPasses
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> 0
puts "A year passes..."
tree.oneYearPasses
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> n >= 0
puts "A year passes..."
tree.oneYearPasses
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> m >= n >= 0
puts

puts "4) Picking an orange reduces the number of oranges by one:"
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> n
puts "We pick an orange..."
tree.pickAnOrange
puts "Oranges in the tree: " + tree.countTheOranges.to_s # >> m < n
puts

puts "5) The tree dies after some years:"
puts "A new tree sprouts!"
tree = OrangeTree.new(MAX_AGE, MAX_HEIGHT)
puts "We fast forward 70 years..."
(MAX_AGE + 1).times do
  tree.oneYearPasses
end # >> Your tree slowly whitered away... Now it's just wood.
puts