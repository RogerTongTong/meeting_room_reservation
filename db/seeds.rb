# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

array = ["Totonto", "Los Angles", "Chicago", "Dallas", "Washington DC", "Cincinnati", "Indian Wells"]
array.each do |name|
  Room.create(name: name, city: "Xi'an")
end