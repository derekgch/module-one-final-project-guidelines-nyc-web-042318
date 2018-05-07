def welcome

puts "Welcome!"

end

def get_drink_from_user
  puts "please enter a drink"

  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
