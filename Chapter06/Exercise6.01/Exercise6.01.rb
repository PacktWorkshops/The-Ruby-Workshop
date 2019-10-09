module Logger 

 

  def log_message(level, message) 

    File.open("ServiceLogs.txt", "a") do |f| 

      f.write "#{level}: #{message}\n" 

    end 

  end 

end 
class Service 

 

  include Logger 

  def stop_service(service_name) 

    log_message :info, "Stopping service: #{service_name}" 

    sleep 3 

    log_message :info, "The service: #{service_name} was stopped!" 

  end 

 

  def start_service(service_name) 

    log_message :inf, "Starting the service: #{service_name}" 

    sleep 2 

    log_message :info, "The service: #{service_name} was started!" 

  end 

end 
TestService = Service.new 

TestService.stop_service("Windows Update") 

TestService.start_service("Windows Update") 
