class Factory
    define_method("operate_machinery") do |argument|
          "Starting machines on all assembly lines in #{argument}"
    end
  
    define_method("package_products") do |argument|
          "Packaging #{argument} products "
    end
    
    define_method("send_for_distribution") do |argument|
      "Sending for distribution for #{argument}"
    end

    define_method("generate_exit_pass") do |argument|
        "Generate exit pass for #{argument}"
      end
  end
  
  factory = Factory.new
  puts factory.operate_machinery("Manchester")
  puts factory.package_products("healthcare")
  puts factory.send_for_distribution("medical stores")
  puts factory.generate_exit_pass("trucks")