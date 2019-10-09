require 'net/http'

uri = URI('https://www.packtpub.com')

response = Net::HTTP.get_response(uri)
puts response.code
puts response.body
