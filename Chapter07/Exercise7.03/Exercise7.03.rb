require "csv"

users = [
  { name: "John Smith", age: 36, city: "Sydney" },
  { name: "Susan Alan", age: 31, city: "San Francisco" },
  { name: "Daniel Jones", age: 43, city: "New York" }
]

CSV.open("new_users.csv", "w") do |csv|
  users.each do |user|
    csv.puts [user[:name], user[:age], user[:city]]
  end
end
