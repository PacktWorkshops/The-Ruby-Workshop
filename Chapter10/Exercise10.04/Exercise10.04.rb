class WelcomeMessage
  countries = %w(fr jp eng de br)
  countries.each do |country|
    define_method("message_for_#{country}") do |argument|
        "Welcome to Ruby Fundamentals, this is a reader from #{argument}."
    end
  end
end

greeting = WelcomeMessage.new
puts greeting.message_for_fr("France")
puts greeting.message_for_jp("Japan")
puts greeting.message_for_eng("England")
puts greeting.message_for_de("Germany")
puts greeting.message_for_br("Brazil")
