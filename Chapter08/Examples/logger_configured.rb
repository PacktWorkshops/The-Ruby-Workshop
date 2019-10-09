require 'logger'

logger = Logger.new(STDOUT, progname: "MyApp", level: Logger::ERROR)
logger.debug("User 23643 logged in")