# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

file_content = File.read('./recipes-en.json')
recipes = JSON.parse(file_content)

recipes_number = Recipe.count

if recipes_number > 10
  puts "Database already seeded with #{recipes_number} recipes. Skipping seeding."
  return
else
  puts "Seeding database with recipes."
end

recipes.each do |recipe|
  puts "creating #{recipe['title']}"
  Recipe.create!(
    {
      title: recipe['title'],
      instruction: recipe['cuisine'],
      image: recipe['image'],
      ingredients: recipe['ingredients']
    }
  )
end
