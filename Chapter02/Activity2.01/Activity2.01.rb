rand 2 

def roll 
  rand(6) + 1 

end 

puts roll 

def roll(sides) 
  rand(sides) + 1 

end 

puts roll(6) 

def roll(sides, number=1) 

  roll_array = [] 

  number.times do 

    roll_value = rand(sides) + 1 

    roll_array << roll_value 

  end 

  total = 0 

  roll_array.each do |roll| 

    new_total = total + roll 

    total = new_total 

  end 

  total 

end 

puts "Rolling a 5 sided die!" 

puts roll(5) 

 
puts "Rolling two 6 sided dice!" 

puts roll(6, 2) 
