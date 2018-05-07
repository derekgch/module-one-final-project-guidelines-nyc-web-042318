def welcome
puts "Welcome!"
end

def get_drink_from_user
  puts "please enter a drink"
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

def choose_number
  puts "Please pick a number"
  user_input = gets.chomp
  user_input.to_i
end


def get_user_name
  puts "please enter your name"
  gets.chomp
end



def save?
  puts "Do you want to save the recipe? y/n"
  gets.chomp.downcase
end
