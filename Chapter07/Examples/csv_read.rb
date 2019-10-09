require 'CSV'
users = CSV.read("users.csv")
users.each do |user|
  puts "name: #{user[0]}"
  puts "age: #{user[1]}"
  puts "city: #{user[2]}"
end