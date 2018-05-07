require 'rest-client'
require 'json'
require 'pry'

def get_drink_from_api(drink)
  #make the web request
  # drink =[]
  link_by_name = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{drink}"
  drink_page = parse_api(link_by_name)
  #we can try to break once the character is found.
  #
end

def all_drink_from_result(result_hash)
  counter = 1
  result_hash["drinks"].each do |drink|
    puts "#{counter}. #{drink["strDrink"]}"
    counter +=1
  end
end

def choose_number
  puts "Please pick a number"
  user_input = gets.chomp
  user_input.to_i
end

def show_recipe(result_hash, num)
   puts result_hash["drinks"][num - 1]["strDrink"]
end


  #  RestClient.get('http://www.swapi.co/api/people/')
  # character_hash = JSON.parse(all_characters)


# parse single URL, return hash
def parse_api(link)
  drink_data ={}
  drink_url_link = RestClient.get(link)
  drink_data = JSON.parse(drink_url_link)
  # binding.pry
end
