# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Ingredient.destroy_all

url = "https://www.bbcgoodfood.com/search/recipes"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

Recipe.create()

# parse recipe titles and URLs
html_doc.search('.standard-card-new__article-title').each do |element|
  title = element.text.strip
  Recipe.name << title
  # food_link = element.attribute('href').value
end

#parse descriptions
html_doc.search('.standard-card-new__description').each do |element|
  description = element.text.strip
end
# <a href="/recipes/homemade-kefir" class="body-copy-small standard-card-new__description">Make your own milk kefir with our easy-to-follow recipe. This tangy fermented dairy drink is similar to yogurt and packed with beneficial probiotic bacteria</a>

# Parse Cooking Time
# Parse Difficulty
html_doc.search('.icon-stack').each do |element|
  time = element.text.strip
  difficulty = element.text.strip
end

# Parse Photo
html_doc.search('.img-container__image img-fluid').each do |element|
  image = element.strip
end
# <img class="img-container__image img-fluid" src="https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=45&amp;resize=504,458" title="Homemade kefir recipe" alt="Milk kefir in glasses on a board" height="458" width="504" srcset=" https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=45&amp;resize=2400,2180 2400w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=45&amp;resize=1920,1744 1920w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=45&amp;resize=1440,1308 1440w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=45&amp;resize=1200,1090 1200w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=90&amp;resize=960,872 960w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=90&amp;resize=720,654 720w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=90&amp;resize=576,523 576w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=90&amp;resize=360,327 360w, https://images.immediate.co.uk/production/volatile/sites/30/2020/07/keffir-8900695.jpg?quality=90&amp;resize=180,163 180w," sizes="(min-width: 992px) 300px, (min-width: 768px) 230px, (min-width: 576px) 268px, (min-width: 544px) 50vw, 100vw">

# Parse Ingredients
food_link.each do | url |
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  
  html_doc.search('.list > li > .list-item').each do |element|
    ingredients = element.text.strip
  end
end










=begin ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end =end

