
require 'uri'
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

# api_res["results"].each do |recipe|
  #puts recipe["name"]
#end

#api_res["results"].each do |recipe|
 # puts recipe["description"]
#end

api_res["results"].each do |recipe|
 #puts recipe["sections"][0]["components"]#[0]#["ingredient"]#["name"]
 recipe["sections"][0]["components"].each do |ingredient|
  next if recipe["sections"][0]["components"][0]["ingredient"].nil?
  ingName = ingredient["ingredient"]["name"]
  Ingredient.create(name: ingName)
 end
end

