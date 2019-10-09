ENV['TEST'] = "true"
require './application'
Dir["./tests/*rb"].each { |f| require f }
