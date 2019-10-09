require "terminal-table"
headings = ["Name", "City"]
users = [
	["James", "Sydney"],
	["Chris", "New York"]
]
table = Terminal::Table.new rows: users,  headings: headings
puts table
