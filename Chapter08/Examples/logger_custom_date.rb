require 'logger'

logger = Logger.new(STDOUT)
logger.datetime_format = "%h %d %Y - %I:%M:%S%P "
logger.debug("User 23643 logged in")