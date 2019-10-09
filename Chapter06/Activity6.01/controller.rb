require_relative './controller_logger'
class Controller
  prepend ControllerLogger

  attr_reader :voting_machine
  
  class InvalidChoiceException < Exception;end

  def self.run_controller(controller_name, machine)
    raise InvalidChoiceException unless valid_controller_name?(controller_name)

    # Find controller
    controller_class = lookup_controller(controller_name)

    # Instatiate it and run it
    controller = controller_class.new(machine)
    controller.run
  end

  # Find Subclass based on name convention
  def self.lookup_controller(name)
    return nil unless valid_controller_name?(name)
    controller_name = "#{name.to_s.capitalize}Controller"
    return const_get(controller_name)
  end

  # Check if the controller name is valid
  # by checking if a constant is defined that matches the convention
  # The constants are declared via the class definition
  def self.valid_controller_name?(controller_name)
    return false if controller_name == "" || controller_name.nil?
    const_defined?("#{controller_name.to_s.capitalize}Controller")
  end

  def initialize(voting_machine)
    @voting_machine = voting_machine
  end

  # wrap the get input
  def get_input(variable_symbol, question=nil)
    present(question, newline: false) if question

    # creating this method allows us to test it easily
    # without requiring terminal input
    set_input_variable(variable_symbol, gets.chomp)

  end

  # For the same reason as logging, we want to have a central
  # method that is responsible for showing output to the user
  # This way if we want to customize it, we can do it in one
  # place
  def present(output, newline: true)
    # ternary operator FTW
    newline ? puts(output) : print(output)
  end

  def run
    # For methods that must be implemented by subclasses
    # Its a good practice to implement the method at the 
    # base class and to raise an exception with the appropriate
    # message. 
    raise "Must be implemented by subclass"
  end

  def set_input_variable(variable_symbol, value)
    # be careful setting instance variables in this way
    # if the variable_symbol comes from user input or
    # is not validated, it could have unintended consequences    
    instance_variable_set("@#{variable_symbol}", value)
  end
end
# you have to require the subclasses at the bottom of this file
# to ensure that the base class is loaded. There are other ways
# to accomplish this, but this will suffice for this activity.
Dir["./controllers/*rb"].each { |f| require f }


