
# Program Logger.
# Write a method called log, which takes a string description of a block and, of
# course, a block. Similar to  doSelfImportantly, it should puts a string
# telling that it has started the block, and another string at the end telling
# you that it has finished the block, and also telling you what the block
# returned. Test your method by sending it a code block. Inside the block, put
# another call to log, passing another block to it. (This is called nesting.)
# In other words, your output should look something like this:

# Beginning "outer block"...
# Beginning "some little block"...
# ..."some little block" finished, returning:  5
# Beginning "yet another block"...
# ..."yet another block" finished, returning:  I like Thai food!
# ..."outer block" finished, returning:  false

def log(description, &block)
  puts  "Beginning \"" + description + "\"..."
  value = yield.to_s
  puts  "...\"" + description + "\" finished, returning: " + value
end

outer = Proc.new do
  little  = Proc.new do
    5
  end

  another = Proc.new do
    "I like Thai food!"
  end

  log("some little block", &little)
  log("yet another block", &another)

  false
end

log("outer block", &outer)
