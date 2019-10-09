require "csv"
CSV.open("new_users.csv", "w") do |csv|
  csv.puts ["Sarah Meyer", "25", "Cologne"]
  csv.puts ["Matt Hall", "35", "Sydney"]
end