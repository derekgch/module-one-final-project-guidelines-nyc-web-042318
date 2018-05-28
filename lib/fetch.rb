require 'rest-client'
require 'json'
require 'pry'

# def show_recipes?(user)
#   if user.recipes.count == 0
#     puts "\nYou have no saved recipes"
#     continue_story
#   else
#     show_user_recipe_list(user)
#     puts ""
#     puts "Choose a number to display recipe"
#     user_input = gets.chomp.to_i
#     choose_recipe_to_display(user, user_input)
#   end
# end

def choose_recipe_to_display(user, user_input)
  # until user_input
  #
  # end
  if user_input > user.recipes.count || user_input <= 0
    puts "\nPlease make valid selection"
    show_user_recipe_list(user)
    user_input = gets.chomp.to_i
    choose_recipe_to_display(user, user_input)
  else
  response = get_drink_from_api_by_id(user.recipes[user_input -1].drinkid)
  show_recipe(response, 1)
  end
end




def get_all_user_recipes(user)
  user.recipes.map do |recipe|
    response = get_drink_from_api_by_id(recipe.drinkid)
    show_recipe(response, 1)
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

def get_random_drink_from_api()
  link_by_random = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  drink_hash = parse_api(link_by_random)
end

def get_drink_from_api_by_ingredient(ingredient)
  link_by_name = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
  drink_hash = parse_api(link_by_name)
  # binding.pry
end

def add_to_array(ingredient)
  arr = []
  drink_hash = get_drink_from_api_by_ingredient(ingredient)
  if drink_hash != nil
    drink_hash["drinks"].each do |drink|
      hash = {}
      hash[drink["strDrink"]] = drink["idDrink"]
      arr << hash
    end
  end
    arr
end



def all_drink_from_result(result_hash)
  counter = 1
  rows = []
  # row = []
  result_hash["drinks"].each do |drink|
    rows << "#{counter}_#{drink["strDrink"]}".split("_")
    counter +=1
  end

  table = Terminal::Table.new :rows => rows
  puts table
  counter-1
end



def show_recipes_email(user)
  if user.recipes.count == 0
    puts "\nYou have no saved recipes"
    continue_story
  else
    show_user_recipe_list(user)
    puts ""
    puts "Please select a recipe to continue"
    user_input = gets.chomp
    # choose_recipe_to_email(user, user_input)
  end
  user_input
end

def choose_recipe_to_delete(user)
  if user.recipes.length > 0
    user_input = show_user_recipe_list(user)
    recipe_to_delete = find_recipe_by_name_in_user(user,user_input)
    result = delete_recipe_from_user(user,recipe_to_delete)
    # binding.pry
    puts "Recipe deleted." if result.recipe_id == recipe_to_delete.id

  else
    puts "You have nothing saved."
    continue_story

  end

end



def choose_recipe(user)
  # user_input = show_recipes_email(user)
  response = []
  # binding.pry
  # while user_input.to_i > user.recipes.count || user_input.to_i <= 0
    # puts "\nPlease make valid selection.\nEnter menu to go back or exit to get out."
    if user.recipes.length > 0
      user_input = show_user_recipe_list(user)
    else
      puts "You have nothing saved."
      continue_story
      return response
    end

    # user_input = gets.chomp
    # binding.pry
    # exit_this if user_input.downcase == "exit"
    # break if user_input.downcase == "menu"
  # end
  if user_input.downcase != "menu"
    response = get_drink_from_api_by_id(user.recipes.find_by(name: user_input).drinkid)
  end
  response
  # save_recipe_to_email(response, 1)
end

def save_recipe_to_email(result_hash,num)
  output=[]
  output<< result_hash["drinks"][num - 1]["strDrink"]
  drink_hash=result_hash["drinks"][num - 1]
  strIngredient = "strIngredient"
  strMeasure ="strMeasure"
  count =1
  output<< "Ingredient:"
  until drink_hash[strIngredient+count.to_s] == ""
    output<< drink_hash[strMeasure+count.to_s] + drink_hash[strIngredient+count.to_s]
    count +=1
  end
  output<< drink_hash["strInstructions"]

end


def show_recipe(result_hash, num)
  # rows = []
   puts "#{result_hash["drinks"][num - 1]["strDrink"]}"
   drink_hash=result_hash["drinks"][num - 1]
   strIngredient = "strIngredient"
   strMeasure ="strMeasure"
   count =1
   puts "Ingredient:"
   until drink_hash[strIngredient+count.to_s] == ""
     puts"#{drink_hash[strMeasure+count.to_s]}  #{drink_hash[strIngredient+count.to_s]}"
     count +=1
   end
   puts "#{drink_hash["strInstructions"]}"

   # table = Terminal::Table.new :rows => rows
   # puts table

   continue_story
   drink_hash
 end



  #  RestClient.get('http://www.swapi.co/api/people/')
  # character_hash = JSON.parse(all_characters)


# parse single URL, return hash
def parse_api(link)
  drink_data ={}
  drink_url_link = RestClient.get(link)
    if drink_url_link == ""
      return nil
    else
      drink_data = JSON.parse(drink_url_link)
    end
  # binding.pry
end
