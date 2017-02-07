# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ["David", "Rick", "Daryl", "Glenn", "Norman", "Dixon", "Maggie", "Carl", "Michonne", "Carol", "Abraham", "Morgan"]

names.each do |name|
	survivor = Survivor.create(name: name , age: 23, gender: "Male", lat: 3, long: 2, infected_reports: 0)
	survivor.inventory = Inventory.create(water: 1, food: 2, medication: 1, ammunition: 3)
end
