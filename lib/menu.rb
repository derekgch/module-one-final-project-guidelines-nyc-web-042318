# encoding: utf-8
require "pry"
require "tty-prompt"
# require_relative "../lib/tty-prompt"





def show_user_recipe_list(user)
  # counter = 1
  prompt = TTY::Prompt.new

  alfabet = user.recipes.map{|recipe| recipe.name}

  ans = prompt.enum_select('Which drink?', alfabet, per_page: 8)
   # user.recipes.each do |recipe|
   #   puts "#{counter}. #{recipe.name}"
   #   counter +=1
   # end
end





def main_menu(user)
  puts "\nHi #{user.user_name}, What do you want to do:\n\n"
  
  a1 = "Search cocktail recipe by name"
  a2 = "Search cocktail recipe by ingredient"
  a3 = "Feeling lucky"
  a4 = "View your saved recipes"
  a5 = "Email your saved recipes"
  a6 = "Delete your saved recipes"
  a7 = "Exit"

  prompt = TTY::Prompt.new

  menus = [a1, a2, a3, a4, a5, a6,a7]

  prompt.on(:keypress) do |event|
    if event.value == 'j'
      prompt.trigger(:keydown)
    end
    if event.value == 'k'
      prompt.trigger(:keyup)
    end
  end

  choice = prompt.select('Choose your options?', menus)

  # binding.pry
  # puts answer.inspect

  # puts "Please enter the number:"
  # choice = gets.chomp
  case choice
  when a1
    drink = get_drink_from_user
    result = get_drink_from_api(drink)
    if valid_drink?(result,drink)
      max_num = all_drink_from_result(result)
      num = choose_number(max_num)
      drink_hash = show_recipe(result, num)
      save_recipe(drink_hash,user)
    end

  when a2
    # call search by ingredient_menu
    result = search_by_ingredient_menu
    result_hash = get_recipe_from_ingredient(result)
    drink_hash = show_recipe(result_hash, 1)
    save_recipe(drink_hash,user)


  when a3
    result = get_random_drink_from_api
    drink_hash = show_recipe(result, 1)
    save_recipe(drink_hash,user)
  when a4
    # show_recipes?(user)
    response = choose_recipe(user)
    show_recipe(response, 1) if !response.empty?
  when a5
    # input = show_recipes_email(user)
    response=choose_recipe(user)
    if !response.empty?
      recipient = get_email_from_user
      message_body=save_recipe_to_email(response,1)
      mail_that(recipient,message_body[0],message_body.join("\n"))
    end
  when a6
    choose_recipe_to_delete(user)
    user.reload
  when a7
    exit_this
  else
    puts "Please enter a valid number."
    continue_story
  end
end
