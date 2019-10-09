def invoice_generator(p1,p2, &block)
    yield calc_discount(p1,p2) if block_given?
end

def calc_discount(p1,p2)
    sum_of_products = p1.to_i+p2.to_i
    final_amount = sum_of_products*0.80
    puts "Price of Product 1: #{p1}"
    puts "Price of Product 2: #{p2}"
    puts "Final amount after 20% discount #{final_amount}"
end

def details(name, id)
    puts "Customer name is #{name}"
    puts "Customer id is #{id}"
end

puts "Enter your Customer Name"
cust_name = gets.chomp
puts "Enter your Customer ID"
cust_id = gets.chomp
puts "Enter Product 1 price"
product1 = gets.chomp
puts "Enter Product 2 price"
product2 = gets.chomp

invoice_generator(product1, product2) do 
    details(cust_name, cust_id)
end 