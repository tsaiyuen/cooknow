#TEST FILE ONLY


=begin require 'uri'
require 'json'
require 'net/http'
require 'openssl'
require 'byebug'

url = URI("https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'

response = http.request(request)
api_res = JSON.parse(response.read_body)

api_res["results"].each do |recipe|
  name = recipe["name"]
  description = recipe["description"]
  image = recipe["thumbnail_url"]
  Recipe.create(name: name, description: description, image: image)
end

api_res["results"].each do |recipe|
 next if recipe["sections"].nil?
 recipe["sections"][0]["components"].each do |ingredient|
  ingName = ingredient["ingredient"]["name"]
  Ingredient.create(name: ingName)
 end
end
 =end