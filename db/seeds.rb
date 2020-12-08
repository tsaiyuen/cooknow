require 'uri'
require 'json'
require 'net/http'
require 'openssl'
require 'byebug'

puts "Cleaning seed..."

RecipeIngredient.destroy_all
SavedRecipe.destroy_all
Review.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
#User.destroy_all

puts "DB clean successfully"
# comment for purposes of commiting
url = URI("https://tasty.p.rapidapi.com/recipes/list?from=0&tags=under_30_minutes")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'
request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]

response = http.request(request)
api_res = JSON.parse(response.read_body)

api_res["results"].each do |recipe|
  puts "Creating recipes..."
  name = recipe["name"]
  description = recipe["description"]
  image = recipe["thumbnail_url"]
  video_url = recipe["original_video_url"]
  
  puts "Recipe instructions:"
  next if recipe["instructions"].nil?

  instructions_array = []

  recipe["instructions"].each do |instruction|
    instructions_array << instruction["display_text"]
  end
  ourRecipe = Recipe.create(name: name, description: description, image: image, video_url: video_url, instructions: instructions_array)
  
  puts ourRecipe.name
  puts ourRecipe.description

  next if recipe["sections"].nil?

  recipe["sections"][0]["components"].each do |ingredient|
    puts "creating ingredient"
    ingName = ingredient["ingredient"]["name"]
 
    puts "creating Ingredient DB"
    ourIngredient = Ingredient.where(name: ingName).first
    if ourIngredient.nil?
      ourIngredient = Ingredient.create(name: ingName)
    end  
    
    puts "creating our Recipe Ingredient"
    recIng = RecipeIngredient.create(recipe: ourRecipe, ingredient: ourIngredient)
  end
 
end

#DON'T DELETE USERS!
# puts "Creating users..."
# user1 = User.create(email:"cynthia@gmail.com", first_name:"Cynthia", last_name:"Tong", password:"123456", phone_number: "123123")
# file1 = open('https://avatars0.githubusercontent.com/u/67703828?v=4')
# user1.photo.attach(io: file1, filename: 'some-image1.jpg')
# user2 = User.create(email:"taro@gmail.com", first_name:"Taro", last_name:"Tomiya", password:"123456", phone_number: "1211")
# file2 = open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1602512708/wpr8u0xszuxl3kvd6l57.jpg')
# user2.photo.attach(io: file2, filename: 'some-image2.jpg')
# user3 = User.create(email:"ken@gmail.com", first_name:"Ken", last_name:"Wall", password:"123456", phone_number: "22222")
# file3 = open('https://avatars3.githubusercontent.com/u/51733007?v=4')
# user3.photo.attach(io: file3, filename: 'some-image3.jpg')
# puts "Finished creating user!"
