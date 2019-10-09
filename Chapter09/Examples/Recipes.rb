require './Chef.rb'
cook "chickensoup" do
  puts "Adding spices"
  puts "Adding water if necessary"
  puts "Waiting for the food to be ready"
end
before "chickensoup" do
  puts "Preparing to cook chicken soup!"
  puts "Preparing bowls, slicing and dicing."
end
after "chickensoup" do
  puts "Cleaning dishes"
  puts "Serving customer"
end
puts "End of chickensoup!"