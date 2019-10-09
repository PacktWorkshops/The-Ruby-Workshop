def mind_reader 

end 
def mind_reader(range) 

  magic_number = rand(range) 

  puts "The magic number is #{magic_number}" 

end 
def mind_reader(range) 

  magic_number = rand(range) 

  puts "What's your guess?" 

  guess = gets.chomp.to_i 

  if guess == magic_number 

    puts "That's right!" 

  else 

    puts "Sorry, that's not correct. The correct number is: #{magic_number}" 

  end 

end 

def mind_reader 

  magic_number = 7 

  guess = nil 

  while guess != magic_number do 

    print "Nope! Try again! " unless guess.nil? 

    puts "What's your guess?" 

    guess = gets.chomp.to_i 

  end 

  puts "That's right!" 

end 
def mind_reader 

  magic_number = 7 

  max_guesses = 3 

  attempts = 0 

  guess = nil 

  while guess != magic_number do 

    print "Nope! Try again! " unless guess.nil? 

    puts "What's your guess?" 

    guess = gets.chomp.to_i 

    break if attempts >= max_guesses 

  end 

 

  puts guess == magic_number ? "That's right!" : "You ran out of guesses, try again later!" 

end 
def mind_reader 

  magic_number = 7 

  max_guesses = 3 

  attempts = 0 

  guess = nil 

  while guess != magic_number do 

    print "Nope! Try again! " unless guess.nil? 

    puts "What's your guess?" 

    guess = gets.chomp.to_i 

    break if attempts >= max_guesses 

    attempts += 1 

  end 

 

  winner = "You've guessed it!" 

  loser = "You ran out of guesses, try again later!" 

  puts guess == magic_number ? winner : loser 

end 