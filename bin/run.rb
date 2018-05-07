require_relative 'config/environment'

require_relative "../lib/fetch.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)
