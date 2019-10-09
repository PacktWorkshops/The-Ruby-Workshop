module ControllerLogger
  # If you aren't using a framework that gives you logging
  # out of the box, its usually a good idea to implement a 
  # centralized logging method at the base class so you get
  # consistent logging and do things like avoid logging output
  # during tests

  def self.prepended(parent_class)
    parent_class.instance_eval do
      def self.inherited(klass)
        klass.send(:prepend, ControllerLogger)
      end
    end
  end

  def log(msg)
    puts msg unless ENV['TEST']
  end

  def run
    log "Starting #{self.class}" if ENV['DEBUG']
    return_val = super
    log "Completed running #{self.class}" if ENV['DEBUG']
    return return_val
  end
end

require_relative './controller_logger'
class Controller
  prepend ControllerLogger
end
