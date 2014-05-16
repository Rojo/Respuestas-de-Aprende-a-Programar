
# Better Logger.
# The output from that last logger was kind of hard to read, and it would just
# get worse the more you used it. It would be so much easier to read if it
# indented the lines in the inner blocks. To do this, you'll need to keep track
# of how deeply nested you are every time the logger wants to write something.
# To do this, use a global variable, a variable you can see from anywhere in
# your code. To make a global variable, just precede your variable name with $,
# like these: $global, $nestingDepth, and $bigTopPeeWee. In the end, your logger
# should output code like this:

# Beginning "outer block"...
#   Beginning "some little block"...
#     Beginning "teeny-tiny block"...
#     ..."teeny-tiny block" finished, returning:  lots of love
#   ..."some little block" finished, returning:  42
#   Beginning "yet another block"...
#   ..."yet another block" finished, returning:  I love Indian food!
# ..."outer block" finished, returning:  true

def log(description, &block)
  puts   ("\t" * $level) +
         "Beginning \"" + description + "\"..."

  # Here the tab level is increased, the block is called and the tab level is
  # decreased afterwards.
  $level = $level + 1
  value  = yield.to_s
  $level = $level - 1

  # Then, the returning value of the block is printed.
  puts   ("\t" * $level) +
         "...\"" + description + "\"" + " finished, returning: " + value
end

# The blocks are defined and logged inside each other.
outer = Proc.new do

  little  = Proc.new do

    teeny = Proc.new do
      "lots of love"
    end

    log("teeny-tiny block", &teeny)

    5
  end

  another = Proc.new do
    "I like Thai food!"
  end

  log("some little block", &little)
  log("yet another block", &another)

  true
end

# The tabulation level is set to 0 and the outer block is logged.
$level = 0
log("outer block", &outer)
