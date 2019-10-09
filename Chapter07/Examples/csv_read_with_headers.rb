require "csv"
users = CSV.read("users_with_headers.csv", headers: true)
users.each do |user|
  puts "name: #{user["name"]}"
  puts "age: #{user["age"]}"
  puts "city: #{user["city"]}"
end
