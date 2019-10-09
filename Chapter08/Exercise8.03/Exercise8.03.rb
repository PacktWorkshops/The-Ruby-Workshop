require 'byebug'

nums = [1, 2, 3, "four"]

nums.each do |num|
  byebug if num.class != Integer
end