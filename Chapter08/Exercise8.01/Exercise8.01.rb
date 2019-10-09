require 'logger'

logger = Logger.new(STDOUT)
logger.info("Starting Application")
begin
  0 / 0
rescue StandardError => e
  logger.error(e.message)
end
