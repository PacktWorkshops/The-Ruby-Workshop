require "csv"
CSV.foreach("users_with_headers.csv", headers: true) do |user|
  puts "name: #{user['name']}"
  puts "age: #{user['age']}"
  puts "city: #{user['city']}"
end