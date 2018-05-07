require_relative '../config/environment.rb'

require_relative "../lib/fetch.rb"
require_relative "../lib/command_line_interface.rb"


welcome
drink = get_drink_from_user
result = get_drink_from_api(drink)
all_drink_from_result(result)
num = choose_number
show_recipe(result, num)
