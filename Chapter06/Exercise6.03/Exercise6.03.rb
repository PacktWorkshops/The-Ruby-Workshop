module ApiWrapper 

 

  def send_message(from, to, message) 

    puts "Hi #{to}, I wanna say #{message}" 

  end 

  def new_post(from, title, description) 

    puts "This is a post from #{from}, with title: #{title} and #{description}" 

  end 

end 
class Facebook 

 

  extend ApiWrapper 

end
Facebook.send_message("Packt","Students","thank you!") 

 

Facebook.new_post("Author","Extending your classes","Extend imports functions from modules as class methods!") 
