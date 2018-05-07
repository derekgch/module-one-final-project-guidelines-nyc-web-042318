require_relative '../config/environment.rb'

require_relative "../lib/fetch.rb"
require_relative "../lib/command_line_interface.rb"


welcome
drink = get_drink_from_user
get_drink_from_api(drink)
# show_character_movies(character)
