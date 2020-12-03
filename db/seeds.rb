# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

p 'deleting recipe ingredients'
RecipeIngredient.destroy_all
p 'recipe ingredients deleted'
p 'deleting  ingredients'
Ingredient.destroy_all
p 'ingredients successfully deleted'
p ' deleting all recipes'
Recipe.destroy_all
p 'destroyed all recipes and ingredients'

puts "opening yummly url"
url = "https://www.yummly.com/recipes"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
puts 'successfully launched url'

puts 'searching for recipes...'
html_doc.search('.card-title').5.times do |element|
  # scrape for title and url of recipe
  title = element.attribute('title').text.strip
  ingredients_url = 'https://www.yummly.com' + element.attribute('href').text.strip
  description = 'helllo this is a niiiiiiiiiiiiiice recipe. very nice.'
# recipe_hash = {
   # name: title,
   # description: description,
 # } 
     Recipe.create(name: title, description: description)
    # begin scraping for ingredients
    # search each recipes page
      ing_html_file = open(ingredients_url).read
      ing_html_doc = Nokogiri::HTML(ing_html_file)
     # select IngredientList class and parse ingredients text
     ing_html_doc.search('.IngredientList').each do |ingElement|
      ingredient = ingElement.search('.ingredient').text.strip
      new_ing = Ingredient.create(name: ingredient)
      recIng = RecipeIngredient.new(ingredient: new_ing, recipe: newrec)
     end
  # create recipe ingredients here
  # add each ingredient to recping
  # instead of tying to recipe, we assign ingredients to this object
end
