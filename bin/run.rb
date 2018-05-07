require_relative '../config/environment.rb'

require_relative "../lib/fetch.rb"
require_relative "../lib/command_line_interface.rb"


welcome
user = get_user_id(get_user_name)
drink = get_drink_from_user
result = get_drink_from_api(drink)
all_drink_from_result(result)
num = choose_number
drink_hash = show_recipe(result, num)
binding.pry
save_recipe(drink_hash,user)
