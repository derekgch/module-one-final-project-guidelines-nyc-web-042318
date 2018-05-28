require 'io/console'
# require "file"


def continue_story
  # puts "\npress any key to continue..."
  # STDIN.getch
  # puts ""
  prompt = TTY::Prompt::new

  prompt.keypress("\nPress space or enter to continue, in :countdown ...", keys: [:space, :return], timeout: 3)
end


def welcome
  banner = File.read('cocktail_med.txt')
  puts banner
puts "Welcome!"
end

def get_drink_from_user
  # puts "please enter a drink"
  # input = gets.chomp.downcase
  prompt = TTY::Prompt.new
  input = prompt.ask('please enter a drink:')
  exit_this if input == 'exit'
  input
  # use gets to capture the user's input. This method should return that input, downcased.
end

def choose_number(max_num)
  # puts "Please pick a number"
  # user_input = gets.chomp
  prompt = TTY::Prompt.new
  user_input = prompt.ask('Please pick a number: ') do |q|
    q.in 1..max_num
    q.messages[:range?] = "Please enter valid selection"
  end
  # prompt.ask('Please pick a number:', convert: :max_num)
  exit_this if user_input == 'exit'
  user_input.to_i
end


def get_user_name
  prompt = TTY::Prompt.new(enable_color: true)
  prompt.ask('Please enter your name:', default: 'Guest')

end



def save?
  puts "Do you want to save the recipe? Y/N"
  input = gets.chomp.downcase
  exit_this if input == 'exit'
  input
end

def exit_this
  abort("Goodbye!")
end

def get_email_from_user
  input = ''
  prompt = TTY::Prompt.new

  input = prompt.ask('What is your email?') do |q|
    q.validate(/\A\w+@\w+\.\w+\Z/, 'Invalid email address')
  end
  input
end



def valid_drink?(result_hash,user_input)
  # binding.pry
  if result_hash["drinks"] == nil
    puts "Cocktail #{user_input} is not found! Please check spelling."
    continue_story
    return false
  else
    return true
  end
end

def valid_email?(email)
  if(!email.empty?&&email.include?('@')&&email.include?('.'))
    return true
  else
    return false
  end
end

#ingredient function
#ingredient function
#ingredient function
#ingredient function



def search_by_ingredient_menu(flag=1)
  array_of_result=[]
  result = []
  common =[]
  if flag >= 1
    while(flag >= 1)
      input = get_ingredient
      flag = 0 if input == "menu"|| input == "exit"
      result = add_to_array(input) if input != nil
      break if input == nil && common.length > 1
      if result.length  < 1
        puts "Not found"
      else
        flag+=1
        array_of_result << result
        common = common_in_array(array_of_result)
        if common.length <1
          # flag -= 1
          puts "No matching cocktails,back to previous results."
          common = array_of_result[0]
          array_of_result.pop()
        end
        # binding.pry
        flag = 0 if common.length < 10
        display_top_ten_of_ingredient_array(common)
      end # if else statement

    end #while statement
  end # if statement
  common
end

def get_ingredient
  prompt = TTY::Prompt.new
  user_input = prompt.ask('Please enter ingredient:')
end


def get_recipe_from_ingredient(common)
  input = choose_number(common.length)
  while (input > common.length || input <= 0)
    display_top_ten_of_ingredient_array(common)
    input = choose_number(common.length)
  end
  # binding.pry
  drinkid = common[input-1].values[0]
  result_hash = get_drink_from_api_by_id(drinkid)
end


def display_top_ten_of_ingredient_array(arr)
  # promt = "Too many results"
  rows = []
  arr.each_with_index do |hash, index|
    # puts promt if index > 9
    break if index > 9
    rows <<  "#{index +1}_#{hash.keys[0]}".split("_")
  end
  table = Terminal::Table.new :rows => rows
  puts table

end

def common_in_array(array_of_array)
  result=array_of_array[0]
  array_of_array.each do |array|
    result = result & array
  end
  result
end


#ingredient function
#ingredient function
#ingredient function
#ingredient function
#ingredient function
