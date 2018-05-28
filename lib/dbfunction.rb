

def save_recipe(recipe,user)

  if save? == 'y'
    if(!list_recipe_id(user).include?(recipe["idDrink"]))
      # binding.pry
      puts "recipe saved"
      user.recipes << Recipe.find_or_create_by(name: recipe["strDrink"],drinkid:recipe["idDrink"])
    else
      puts "You already saved the recipe."
    end
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

def find_recipe_by_name_in_user(user,name)
  user.recipes.all.find_by(name: name)
end

def delete_recipe_from_user(user,recipe)
  rtd = UserRecipe.find_by(user_id: user.id, recipe_id: recipe.id)
  rtd.delete
end


def list_recipe_id(user)
   user.recipes.map{|recipe| recipe.drinkid}
end
