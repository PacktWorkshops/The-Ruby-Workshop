require 'logger'

log_size = 100 * 1024 * 1024
log_limit = 5
logger = Logger.new("log.txt", log_limit, log_size)
logger.debug("User 23643 logged in")
