require 'byebug'

def reversed(name)
  name.reverse
end

users = ["Matt", "Pete", "Brenton", "Geoff"]

users.each do |user|
  byebug
end