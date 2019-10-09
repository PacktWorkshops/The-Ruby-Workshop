require 'csv'
CSV.open("new_users.csv", "w") do |csv|
  csv << ["Sarah Meyer", "25", "Cologne"]
  csv << ["Matt Hall", "35", "Sydney"]
end