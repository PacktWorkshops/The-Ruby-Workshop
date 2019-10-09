require 'logger'

logger = Logger.new(STDOUT)
logger.formatter = proc do |severity, datetime, progname, msg|
  "#{severity} | #{datetime} | #{msg}\n"
end
logger.debug("User 23643 logged in")