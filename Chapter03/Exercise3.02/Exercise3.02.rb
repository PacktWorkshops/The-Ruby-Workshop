def can_purchase?(amount_in_bank, cost_of_item) 

  if amount_in_bank >= cost_of_item 

    return true 

  else 

    return false 

  end 

end

def can_purchase?(amount_in_bank, cost_of_item) 

  if amount_in_bank < cost_of_item 

    return false 

  else 

    return true 

  end 

end 
bank_balance = 100 

cost_of_item = 200 

if can_purchase?(bank_balance, cost_of_item) 

  puts "You can purchase this item" 

else 

  puts "Sorry, you don't have enough money to buy this item" 

end 