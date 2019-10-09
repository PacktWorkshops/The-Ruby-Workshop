require 'net/http'
require 'json'

url = 'https://www.akshatpaul.com/ruby-fundamentals/list-all-properties'
uri = URI(url)
response = Net::HTTP.get(uri)
puts JSON.parse(response)