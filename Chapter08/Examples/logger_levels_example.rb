require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::INFO
logger.info("Starting Application")
users = ["Matt", "Pete", "Brenton", "Geoff"]

if users.length > 3
  logger.warn("Warning, there are #{users.length} users")
end

users.each do |user|
  logger.debug("User: #{user}")
end

logger.info("Finishing Application")