# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

Ingredient.destroy_all

url = "https://www.yummly.com/recipes"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# recipes = []

html_doc.search('.card-title').each do |element|
  title = element.attribute('title').text.strip
  ingredients_url = element.attribute('href').text.strip
  description = 'helllo this is a niiiiiiiiiiiiiice recipe. very nice.'
  recipe = {
    title: title,
    description: description
  } 
  newrec = Recipe.create(name: recipe["title"], description: recipe["description"])
  # recipes << recipe
  puts newrec
end

print recipes
#RecipeIngredient.create(recipe: recipe1, ingredient: ingr01)
# Recipe.create(name:"Chicken Pie", description:"Lots of chicken, tomato and potato")

# html_file = open(ingredients_url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search()

# https://www.yummly.com/recipe/Pigs-in-a-Blanket-9057763