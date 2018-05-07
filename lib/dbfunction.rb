

def save_recipe(recipe,user)

  if save? == 'y'
    puts "recipe saved"
    user.recipes << Recipe.create(name: recipe["strDrink"],drinkid:recipe["idDrink"])
  end

end

def get_user_id(user_name)
  User.find_by(user_name: user_name )
# binding.pry
end

def save_user(user)

end



def list_recipe(user)
  puts user.recipes
end
