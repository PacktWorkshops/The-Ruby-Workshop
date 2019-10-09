require 'httparty'

url = 'https://www.akshatpaul.com/ruby-fundamentals/list-all-buildings'
response = HTTParty.get(url)
puts response.code
puts response.parsed_response
