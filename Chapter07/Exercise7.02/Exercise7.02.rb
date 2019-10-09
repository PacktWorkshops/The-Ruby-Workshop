require "csv"
users = CSV.read("exercise_2.csv", headers: true)
cities = users.by_col["city"]
puts cities