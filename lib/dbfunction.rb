

def save_recipe(recipe,user)

  if save? == 'y'
    puts "recipe saved"
    user.recipes << Recipe.create(name: recipe["strDrink"],drinkid:recipe["idDrink"])
  end

end

def get_user_id(user_name)
  result = User.find_by(user_name: user_name )
  if(result == nil)
    result = save_user(user_name)
  end
  result
# binding.pry
end

def save_user(user_name)
  User.create(user_name: user_name)
end



def list_recipe(user)
  user.recipes
end
