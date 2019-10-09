require 'httparty'

url = "https://www.akshatpaul.com/ruby-fundamentals/buildings"
response = HTTParty.post(url, body: { property: {name: "Mr. Ruby Noobie", address: "Tokyo" }})
puts response.code
