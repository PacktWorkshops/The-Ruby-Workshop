module ApplicationDebugger 

  def debug(args) 

    puts "Application debug start: #{args.inspect}" 

    result = super 

    puts "Application debug finished: #{result}"  

  end 

end 
class Application 

  prepend ApplicationDebugger 

  def debug(args) 

    {result: "ok"} 

  end 

end 
DBugger = Application.new 

DBugger.debug("NotePad") 

