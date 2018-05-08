require 'rest-client'
require 'json'
require 'pry'

def show_recipes?(user)
  puts "Would you like to see all your recipes? y/n"
  user_input = gets.chomp.downcase
  if user_input == "y"
    var = get_all_user_recipes(user)
  else
    puts "Goodbye"
  end
end

def get_all_user_recipes(user)
  user.recipes.map do |recipe|
    response = get_drink_from_api_by_id(recipe.drinkid)
    show_recipe(response, 1)
    puts ""
    puts ""
  end
end

def get_drink_from_api(drink)
  #make the web request
  # drink =[]
  link_by_name = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{drink}"
  drink_page = parse_api(link_by_name)
  #we can try to break once the character is found.
  #
end

def get_drink_from_api_by_id(drink_id)
  link_by_name = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink_id}"
  drink_hash = parse_api(link_by_name)
  # binding.pry
end

def all_drink_from_result(result_hash)
  counter = 1
  result_hash["drinks"].each do |drink|
    puts "#{counter}. #{drink["strDrink"]}"
    counter +=1
  end
end



def show_recipe(result_hash, num)
   puts result_hash["drinks"][num - 1]["strDrink"]
   drink_hash=result_hash["drinks"][num - 1]
   strIngredient = "strIngredient"
   strMeasure ="strMeasure"
   count =1
   puts "Ingredient:"
   until drink_hash[strIngredient+count.to_s] == ""
     puts drink_hash[strMeasure+count.to_s] + drink_hash[strIngredient+count.to_s]
     count +=1
   end
   puts drink_hash["strInstructions"]
   drink_hash
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
