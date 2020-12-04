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
request["x-rapidapi-key"] = '0050c034aemsh3c3e3443da30cb3p164106jsnecd905e6c535'
request["x-rapidapi-host"] = 'tasty.p.rapidapi.com'

response = http.request(request)
api_res = JSON.parse(response.read_body)
instructions_arr = []

api_res["results"].each do |recipe|
    hash = {}
    #byebug
    next if recipe["instructions"].nil?
    recipe["instructions"].each_with_index do |instruction, index|
      hash[index.to_s] = instruction["display_text"]
    end
  instructions_arr << hash
end

puts instructions_arr
