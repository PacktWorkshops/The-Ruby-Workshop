def generate_deck 

  cards = (1..13) 

  suits = ["Diamonds", "Clubs", "Spades", "Hearts"] 

  deck = [] 

  suits.each do |suit| 

    cards.each do |card| 

      deck << [card, suit] 

    end 

  end 

  return deck 

end
def shuffle_deck(deck) 

  shuffled_deck = [] 

  while(deck.length > 0) do  

    random_card_index = rand(deck.length) 

    shuffled_deck << deck.delete_at(random_card_index) 

  end 

  return shuffled_deck 

end 
def inspect_cards(cards, format: :short) 

  hand = cards.map{|c| card_label(c, format: format)}.join(",") 

  total = calculate_total(cards) 

  "#{hand} (#{total})" 

end 
def card_label(card, format: :short) 

  card_labels = {1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"} 

  card_suit_labels = {"Diamonds" => "♦", "Clubs" => "♣", "Spades" => "♠", "Hearts" => "♥"} 

 

  card_index, card_suit = card 

 

  label = card_labels[card_index] || card_index 

  icon = card_suit_labels[card_suit] 

  if format == :short 

    "#{label}#{icon}" 

  else 

    "#{label} of #{card_suit}" 

  end 
  def play(deck) 

  player_hand = deal_cards(deck, 2) 

  dealer_hand = deal_cards(deck, 2) 

  puts "Player has: #{inspect_cards(player_hand)}" 

  puts "Dealer has: #{inspect_cards([dealer_hand[0]])}, <other card hidden>" 

 

  choice = nil 

  while choice != 'stay' && calculate_total(player_hand) <= 21 do 

    print "Do you want to hit or stay?" 

    choice = gets.chomp 

    if choice == 'hit' 

      player_hand += deal_cards(deck, 1) 

    end 

    print "Your cards are now: #{inspect_cards(player_hand)}\n" 

  end 

 

  while((dealer_total = calculate_total(dealer_hand)) <= 21 && (dealer_total < 17)) do  

    dealer_hand += deal_cards(deck, 1) 

  end 

 

  player_total = calculate_total(player_hand) 

  dealer_total = calculate_total(dealer_hand) 

  if player_total > 21 

    puts "Player busts! #{player_total}" 

  elsif player_total == 21 && dealer_total != 21 

    puts "21! A winner!" 

  elsif player_total > dealer_total 

    puts "Player wins!" 

  elsif dealer_total > 21 

    puts "Dealer busts! Player wins" 

  elsif player_total == dealer_total 

    puts "It's a tie!" 

  else 

    puts "Dealer wins! " 

  end 

  puts "Dealer hand: #{show_hand(dealer_hand)}" 

  puts "Player hand: #{show_hand(player_hand)}" 

end 

 

def show_hand(cards) 

  total = calculate_total(cards) 

  "#{total} (#{inspect_cards(cards)})" 

end 
def card_value(cards, card) 

  case card 

 

  # face cards are 10 

  when 11..13 

    10  

  when 1 # Ace can be 1 or 11 depending on the rest of the cards 

    # simple algorithm for determining what Ace should count as 

    # get total value of all non-ace cards 

    non_ace_cards = cards.reject{|c| c[0] == 1} 

    non_ace_card_total = calculate_total(non_ace_cards) 

 

    # If the Ace as 11 busts us, count it as a 1 

    if (non_ace_card_total + 11) > 21 

      1 

 

    # If the Ace as an 11, gets us to 21, count it as an 11 

    elsif (non_ace_card_total + 11) == 21 

      11 

 

    # otherwise, count is as a 1 

    else 

      1 

    end  

  else 

    card 

  end 

end 

 

def calculate_total(hand) 

  hand.inject(0){|sum, card| card_value(hand, card[0]) + sum} 

end 

 

def deal_cards(cards, amount) 

  if cards.length >= amount 

    cards.shift(amount) 

  else 

    raise "No more cards to deal, game over!" 

  end 

end 

end 
shuffled_deck = shuffle_deck(generate_deck) 

choice = 'y' 

while(shuffled_deck.length > 4 && choice.downcase != 'n') do # need at least 4 cards to play 

  puts "Deck has: #{shuffled_deck.length} cards left" 

  print "Do you want to play a hand?[Yn]" 

  choice = gets.chomp 

  if choice.downcase == 'y' 

    play(shuffled_deck) 

  end 

end 

 

# Tests 

# puts calculate_total([[12, "Hearts"]]) # 12 

# puts calculate_total([[1,"Spades"],[12, "Hearts"]]) #21 

# puts calculate_total([[13,"Hearts"],[6, "Hearts"]]) # 16 