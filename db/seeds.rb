# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
puts 'seed'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = JSON.parse(open(url).read)
drinks['drinks'].each do |ingredient|
  item = Ingredient.new(name: ingredient['strIngredient1'])
  item.save
  puts "#{item.name} created!"
end

puts "Seed done, we have #{Ingredient.count} ingredients."
