require "csv"

cities = [
  { name: "San Francisco", country: "United States", employees: 15 },
  { name: "Sydney", country: "Australia", employees: 11 },
  { name: "London", country: "England", employees: 18 }
]

CSV.open("employee_count.csv", "w") do |csv|
  cities.each do |city|
    csv.puts [city[:name], city[:country], city[:employees]]
  end
end