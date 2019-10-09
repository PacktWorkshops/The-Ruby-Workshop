def calculator(a, b)
    yield(a, b)
  end
  
#Addition 

puts calculator(8, 2) { |a, b| a + b } 

#Multiplication  

puts calculator(8, 2) { |a, b| a * b }  

#Subtraction 

puts calculator(8, 2) { |a, b| a - b } 

#Division 

puts calculator(8, 2) { |a, b| a / b } 