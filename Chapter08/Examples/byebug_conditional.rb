require 'byebug'

users = ["Matt", "Pete", ["John"], "Brenton", "Geoff"]

users.each do |user|
  byebug if user.class != String
end