require 'logger'

logger = Logger.new("log.txt", "daily")
logger.debug("User 23643 logged in")
