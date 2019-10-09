original_price = [100,200,300,400,999] 

puts "The original price for the stocks: #{original_price}" 

price_profit = Proc.new do |price_list|  

    result = Array.new 

    price_list.each do |i|         

        result << i * 1.25 

    end 

    result 

end 

new_price_with_profit = price_profit.call(original_price) 

puts "The new price for the stocks #{new_price_with_profit}" 
