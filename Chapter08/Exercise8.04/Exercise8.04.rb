counter = 0
users = ["Matt", "Pete", "Brenton", "Geoff"]

def greet_user(user)
  puts "Hello #{user}"
end

users.each do |user|
  greet_user user
  counter += 1
end