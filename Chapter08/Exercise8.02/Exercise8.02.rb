require 'logger'

logger = Logger.new("log.txt", 5, 100)
logger.debug("Testing Log Rollover")
