
# One billion seconds...
# Find out the exact second you were born (if you can). Figure out when you will
# turn (or perhaps when you did turn?) one billion seconds old. Then go mark
# your calendar.

# When was I born? Mmmmm... Mom tells me it was a thursday, on August 6th, 1981,
# around 1 p.m., so...

birth   = Time.mktime(1981, 8, 6, 13, 0, 0)
billion = birth + 1_000_000_000 # one english billion seconds after

puts billion
