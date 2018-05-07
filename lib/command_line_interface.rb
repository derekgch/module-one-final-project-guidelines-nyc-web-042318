def welcome
puts "Welcome!"
end

def get_drink_from_user
  puts "please enter a drink"
  input = gets.chomp.downcase
  exit_this if input == 'exit'
  input
  # use gets to capture the user's input. This method should return that input, downcased.
end

def choose_number
  puts "Please pick a number"
  user_input = gets.chomp
  exit_this if user_input == 'exit'

  user_input.to_i
end


def get_user_name
  puts "please enter your name"
  input = gets.chomp
  exit_this if input == 'exit'
  input
end



def save?
  puts "Do you want to save the recipe? y/n"
  input = gets.chomp.downcase
  exit_this if input == 'exit'
  input
end

def exit_this
  abort("Goodbye!")
end
