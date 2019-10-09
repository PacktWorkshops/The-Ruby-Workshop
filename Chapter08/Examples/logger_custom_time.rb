require 'logger'

logger = Logger.new(STDOUT)
logger.datetime_format = "%I:%M:%S%P "
logger.debug("User 23643 logged in")