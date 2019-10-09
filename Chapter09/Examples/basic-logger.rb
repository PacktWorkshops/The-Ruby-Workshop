def basic_logger
    sleep 3
    puts "****"
    puts "Inside basic logger statement 1"
    sleep 3
    puts "Inside basic logger statement 2"
    sleep 3
    puts "****"
end

def my_method(&block)
   puts "Method statement 1"
   yield basic_logger if block_given? 
   puts "Method statement 2"
   puts "****"
end

my_method
my_method {puts "Back from Basic logger"}