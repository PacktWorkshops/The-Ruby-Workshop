def basic_logger 

 

    sleep 3 

    puts "****" 

    puts "Changing flight status…" 

    sleep 3 

    puts "Flight status was changed!" 

    sleep 3 

    puts "****" 

end 
def my_method(&block) 

   puts "Flight Status changer starting" 

   yield basic_logger if block_given?  

   puts "Flight Status changer ended" 

   puts "****" 

end 
my_method 

my_method {puts " Changed Flight status to Departure "} 