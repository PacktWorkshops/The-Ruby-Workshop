require 'logger'

logger = Logger.new(STDOUT)
logger.debug("debug")
logger.info("info")
logger.warn("warn")
logger.error("error")
logger.fatal("fatal")
