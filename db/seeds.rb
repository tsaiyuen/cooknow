require 'uri'
require 'json'
require 'net/http'
require 'openssl'


puts "Cleaning seed..."

RecipeIngredient.destroy_all
SavedRecipe.destroy_all
Review.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
User.destroy_all

puts "DB clean successfully"
# comment for purposes of commiting
url = URI("https://tasty.p.rapidapi.com/recipes/list?from=0&size=100&tags=under_30_minutes")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'
request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]

response = http.request(request)
api_res = JSON.parse(response.read_body)

puts "Creating recipes..."
api_res["results"].each do |recipe|
  name = recipe["name"]
  description = recipe["description"]
  image = recipe["thumbnail_url"]
  video_url = recipe["original_video_url"]
  
  next if recipe["instructions"].nil?
  
  instructions_array = []
  
  recipe["instructions"].each do |instruction|
    instructions_array << instruction["display_text"]
  end
  ourRecipe = Recipe.create(name: name, description: description, image: image, video_url: video_url, instructions: instructions_array)
  
  puts ourRecipe.name
  puts "Recipe description:"
  puts ourRecipe.description
  puts "Recipe instructions:"
  puts ourRecipe.instructions

  next if recipe["sections"].nil?

  recipe["sections"][0]["components"].each do |ingredient|
    #puts "creating ingredient"
    ingName = ingredient["ingredient"]["name"].capitalize
 
    #puts "creating Ingredient DB"
    ourIngredient = Ingredient.where(name: ingName).first
    if ourIngredient.nil?
      ourIngredient = Ingredient.create(name: ingName)
    end  
    
    #puts "creating our Recipe Ingredient"
    recIng = RecipeIngredient.create(recipe: ourRecipe, ingredient: ourIngredient)
  end
  
 
end

puts "creating extra recipes"
recipe1 = Recipe.create(name: "One-Pan Winter Chicken Roast", description: "This is the perfect dish for quick and delicious meals!
Without anything too elaborate, you will impress your guests with this juicy and tasty chicken dish!", image: "https://img.buzzfeed.com/video-api-prod/assets/46e8ca7617274ec89936616421fae220/BFV14052_OnePanAutumnChickenDinner-ThumbTextless1080.jpg", video_url: "https://vid.tasty.co/output/13229/mp4_640x640/1477606774", instructions: ["Preheat the oven to 400˚F (200˚C).", "On a baking sheet, toss the sweet potato, Brussels sprouts, and sliced apples so they’re evenly distributed.", "Lay the chicken thighs on top.", "Drizzle the olive oil over the chicken, fruit, and veggies, and season with salt and pepper.", "Sprinkle with the garlic, rosemary, and thyme.", "Turn the chicken over and season on the other side, then return to skin-side up.", "Bake for 30 minutes, then broil for 5 - 10 minutes so the chicken skin gets golden brown and crispy.", "Enjoy!"])
RecipeIngredient.create(recipe: recipe1, ingredient: Ingredient.find_or_create_by(name: "Potato"))
RecipeIngredient.create(recipe: recipe1, ingredient: Ingredient.find_or_create_by(name: "Chicken"))
RecipeIngredient.create(recipe: recipe1, ingredient: Ingredient.find_or_create_by(name: "Garlic"))
RecipeIngredient.create(recipe: recipe1, ingredient: Ingredient.find_or_create_by(name: "Carrot"))

recipe2 = Recipe.create(name: "Baked Chicken Tikka", description: "This is the famous Chicken Tikka Style - Chicken marinated, grilled or baked in Conventional Oven Or traditional Indian Tandoor. Serve it as Appetizer with onion and Green Chutney of your choice. And this will taste great with some exta ingredietns like potato and carrots!", image: "https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/f62e2e5a3dc443dc9caed4d9894aa8c0.jpeg?output-format=webp&output-quality=auto", video_url: "", instructions: ["Combine all ingredients in a bowl except chicken.", "Make long slits on chicken with a knife.", "Put the chicken in the marinade overnight.", "Bake at 450°F (230°C) for 50 minutes..", "Enjoy!"])
RecipeIngredient.create(recipe: recipe2, ingredient: Ingredient.find_or_create_by(name: "Potato"))
RecipeIngredient.create(recipe: recipe2, ingredient: Ingredient.find_or_create_by(name: "Chicken"))
RecipeIngredient.create(recipe: recipe2, ingredient: Ingredient.find_or_create_by(name: "Garlic"))
RecipeIngredient.create(recipe: recipe2, ingredient: Ingredient.find_or_create_by(name: "Carrot"))

recipe3 = Recipe.create(name: "Honey BBQ Chicken Wings", description: "Honey BBQ Chicken Wings is so juicy and flavourful... They’re crisp and then tossed in Honey BBQ Sauce and covered in a blend of spices. ", image: "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/4c41b09cf41644a7b7ca1780edbeb960/BFV8354_Honey_BBQ_Chicken_Wings-FB1080.jpg?", video_url: "https://vid.tasty.co/output/31936/mp4_640x640/1495124926", instructions: ["Preheat oven to 425°F (220°C).", "In a bowl, combine flour, chili powder, salt, pepper, paprika, and garlic powder. Coat the wings in the flour evenly, shaking off any excess.", "Place the floured wings on a parchment paper–lined baking sheet and spread them out in a single layer.", "Bake for 45 minutes, flipping halfway through, until skin is crispy and golden brown.", "In a separate bowl, combine the BBQ sauce and the honey. Stir the cooked wings in the sauce and coat them evenly.", "Place the coated wings back onto the baking sheet and spread them in a single layer.", "Bake for 8 to 10 minutes, until sauce is bubbly and caramelized. Cool, then serve.", "Enjoy!"])
RecipeIngredient.create(recipe: recipe3, ingredient: Ingredient.find_or_create_by(name: "Potato"))
RecipeIngredient.create(recipe: recipe3, ingredient: Ingredient.find_or_create_by(name: "Chicken"))
RecipeIngredient.create(recipe: recipe3, ingredient: Ingredient.find_or_create_by(name: "Garlic"))
RecipeIngredient.create(recipe: recipe3, ingredient: Ingredient.find_or_create_by(name: "Carrot"))

recipe4 = Recipe.create(name: "Chicken Rollups", description: "You will not want anything else after enjoying this wonderful dish! It is easy and practical and very delicious! Everyone will love it!", image: "https://img.buzzfeed.com/video-api-prod/assets/65b4d49bec3d4483a6f6160d812c5333/BFV6250_BBQChickenRollulps-Thumb1080.jpg?", video_url: "https://vid.tasty.co/output/32109/mp4_640x640/1495125366", instructions: ["Preheat oven to 425°F (220°C).", "Roll out the pizza crust into a rectangle.", "Spread on the BBQ sauce. Top with chicken, onion, cheese, and parsley.", "Roll it up longways, and cut into slices. Bake face-up for 15 minutes.", "Enjoy!"])
RecipeIngredient.create(recipe: recipe4, ingredient: Ingredient.find_or_create_by(name: "Potato"))
RecipeIngredient.create(recipe: recipe4, ingredient: Ingredient.find_or_create_by(name: "Chicken"))
RecipeIngredient.create(recipe: recipe4, ingredient: Ingredient.find_or_create_by(name: "Garlic"))
RecipeIngredient.create(recipe: recipe4, ingredient: Ingredient.find_or_create_by(name: "Carrot"))

puts "Finished creating extra recipes"

#DON'T DELETE USERS!
 puts "Creating users..."
 user1 = User.create(email:"cynthia@gmail.com", first_name:"Cynthia", last_name:"Tong", password:"123456", phone_number: "123123")
 file1 = open('https://avatars0.githubusercontent.com/u/67703828?v=4')
 user1.photo.attach(io: file1, filename: 'some-image1.jpg')
 user2 = User.create(email:"taro@gmail.com", first_name:"Taro", last_name:"Tomiya", password:"123456", phone_number: "1211")
 file2 = open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1602512708/wpr8u0xszuxl3kvd6l57.jpg')
 user2.photo.attach(io: file2, filename: 'some-image2.jpg')
 user3 = User.create(email:"ken@gmail.com", first_name:"Ken", last_name:"Wall", password:"123456", phone_number: "22222")
 file3 = open('https://avatars3.githubusercontent.com/u/51733007?v=4')
 user3.photo.attach(io: file3, filename: 'some-image3.jpg')
 puts "Finished creating user!"
