require 'httparty'

res = HTTParty.post("https://my-json-server.typicode.com/typicode/demo/posts", body: { id: 5, title: "Ruby Fundamentals" })
puts res.code
puts res.body
