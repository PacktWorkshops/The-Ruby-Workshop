#!/usr/bin/env ruby

# require all files in models and controllers directory
require './model'
require './controller'
require './service'
require 'byebug'

class InvalidChoiceException < Exception;end

# Create master class called Application
# which will be the core class that manages the loop
# around the voting machine
class Application
  attr_reader :voting_machine

  def self.run
    app = new(Time.now.month, Time.now.year)
    app.run
  end

  def initialize(month, year)
    @voting_machine = VotingMachine.new(month, year)
  end

  # The main control flow method
  def run

    # print welcome message
    puts MenuController.welcome_message.chomp

    controller = nil

    # The application runs until we receive the choice to exit
    while controller != :exit do

      menu = MenuController.new(voting_machine)
      controller = menu.run

      begin
        # Run the action by using Factory pattern to
        # lookup controller based on name and then run it.
        # Voting machine is what tallies all the votes
        # and is updated by or read from each controller action
        Controller.run_controller(controller, voting_machine)

      # handle when the choice is invalid
      rescue InvalidChoiceException => e
        puts "Your choice was invalid, try again."
      end
    end

  end

end
Application.run unless ENV['TEST'] == "true"




