puts "Cleaning seed..."
RecipeIngredient.destroy_all
SavedRecipe.destroy_all
Review.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
User.destroy_all
puts "DB clean successfully"
puts "Creating ingredients..."
ingr01 = Ingredient.create(name: "potato")
ingr02 = Ingredient.create(name: "tomato")
ingr03 = Ingredient.create(name: "chicken")
ingr04 = Ingredient.create(name: "lettuce")
ingr05 = Ingredient.create(name: "tilapia")
ingr06 = Ingredient.create(name: "mango")
ingr07 = Ingredient.create(name: "meat")
ingr08 = Ingredient.create(name: "onion")
ingr09 = Ingredient.create(name: "salmon")
ingr10 = Ingredient.create(name: "lemon")
ingr11 = Ingredient.create(name: "capers")
ingr12 = Ingredient.create(name: "butter")
ingr13 = Ingredient.create(name: "salt")
ingr14 = Ingredient.create(name: "pepper")
ingr15 = Ingredient.create(name: "garlic")
ingr16 = Ingredient.create(name: "milk")
ingr17 = Ingredient.create(name: "chocolate")
ingr18 = Ingredient.create(name: "cinnamon")
ingr19 = Ingredient.create(name: "cheese")
puts "Finished creating ingredients!"
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
puts "Creating recipes..."
recipe1 = Recipe.create(name:"Tomato and soup", description:"Add tomato add potato and chicken")
RecipeIngredient.create(recipe: recipe1, ingredient: ingr02)
RecipeIngredient.create(recipe: recipe1, ingredient: ingr01)
RecipeIngredient.create(recipe: recipe1, ingredient: ingr03)
recipe2 = Recipe.create(name:"Potato and tilapia", description:"Add lettuce, tilapia and mango")
RecipeIngredient.create(recipe: recipe2, ingredient: ingr04)
RecipeIngredient.create(recipe: recipe2, ingredient: ingr05)
RecipeIngredient.create(recipe: recipe2, ingredient: ingr06)
recipe3 = Recipe.create(name:"Meat with tomato", description:"Add meat, tomato, onion")
RecipeIngredient.create(recipe: recipe3, ingredient: ingr07)
RecipeIngredient.create(recipe: recipe3, ingredient: ingr02)
RecipeIngredient.create(recipe: recipe3, ingredient: ingr08)
recipe4 = Recipe.create(name:"Salmon", description:"Add salmon, lemon and capers")
RecipeIngredient.create(recipe: recipe4, ingredient: ingr09)
RecipeIngredient.create(recipe: recipe4, ingredient: ingr10)
RecipeIngredient.create(recipe: recipe4, ingredient: ingr11)
recipe5 = Recipe.create(name:"Smashed potato", description:"potato, butter, salt, pepper, onion, garlic, milk")
RecipeIngredient.create(recipe: recipe5, ingredient: ingr01)
RecipeIngredient.create(recipe: recipe5, ingredient: ingr12)
RecipeIngredient.create(recipe: recipe5, ingredient: ingr13)
RecipeIngredient.create(recipe: recipe5, ingredient: ingr14)
RecipeIngredient.create(recipe: recipe5, ingredient: ingr08)
RecipeIngredient.create(recipe: recipe5, ingredient: ingr15)
RecipeIngredient.create(recipe: recipe5, ingredient: ingr16)
recipe6 = Recipe.create(name:"Chicken Pie", description:"Lots of chicken, tomato and potato")
RecipeIngredient.create(recipe: recipe6, ingredient: ingr02)
RecipeIngredient.create(recipe: recipe6, ingredient: ingr01)
RecipeIngredient.create(recipe: recipe6, ingredient: ingr03)
puts "Finished creating recipes!"
puts "Creating reviews..."
Review.create( rating: 3, comment: "very good and tasty", user: user1, recipe: recipe1 )
Review.create( rating: 5, comment: "the best one!", user: user3, recipe: recipe1 )
Review.create( rating: 4, comment: "fast and delicious", user: user2, recipe: recipe2 )
Review.create( rating: 5, comment: "just perfect!", user: user1, recipe: recipe2 )
Review.create( rating: 2, comment: "not very good", user: user3, recipe: recipe3 )
Review.create( rating: 5, comment: "really liked this one", user: user2, recipe: recipe3 )
Review.create( rating: 3, comment: "delicious recipe", user: user1, recipe: recipe4 )
Review.create( rating: 5, comment: "Yes! The best", user: user1, recipe: recipe4 )
Review.create( rating: 5, comment: "OMG the best food ever", user: user1, recipe: recipe5 )
Review.create( rating: 4, comment: "Niiiceee", user: user2, recipe: recipe5 )
Review.create( rating: 5, comment: "I loved it", user: user1, recipe: recipe6 )
Review.create( rating: 3, comment: "Difficult recipe", user: user3, recipe: recipe6 )
puts "Finished creating reviews!"
