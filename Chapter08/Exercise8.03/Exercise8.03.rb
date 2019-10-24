require 'logger'
log_bytes = 100
log_limit = 5
logger = Logger.new("log.txt", log_limit, log_bytes)
logger.debug("Testing Log Rollover")
