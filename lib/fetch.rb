require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters =[]
  char_page = parse_api('http://www.swapi.co/api/people/')
  #we can try to break once the character is found.
  #
  while (char_page["next"] != nil)
    all_characters << char_page
    char_page = parse_api (char_page["next"])

  end
  all_characters << char_page

  #  RestClient.get('http://www.swapi.co/api/people/')
  # character_hash = JSON.parse(all_characters)


  array_movies = []
  all_characters.each do |character_hash|
    array_movies << character_hash["results"]
  end
  films_url = []
  array_movies = array_movies.flatten
   # binding.pry


while films_url.length == 0
  array_movies.each do |x|

    if x["name"].downcase == character
     films_url << x["films"]

   end
  end

  if films_url.length == 0
    puts "No such character in Star Wars, please re-enter"
    character = get_character_from_user()

  end

end


 films_url = films_url.flatten
 movie_data = []
 i = 0

while i < films_url.length
 movie_url_link = RestClient.get(films_url[i])
 movie_data << JSON.parse(movie_url_link)

 i+=1

end
movie_data

 # binding.pry
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end





def parse_character_movies(films_hash)
  movie_titles = []
  movie_chars = []
  films_hash.each do |d|

      movie_titles << d["title"]
      movie_chars << d["characters"]

  end

   # binding.pry
  # some iteration magic and puts out the movies in a nice list
i=0
  while i < movie_titles.length
   puts  "#{i+1}. Movie Title:"
   puts  movie_titles[i]
   i+=1
   puts "======="
  end

  num = character_request(movie_titles.length)
  puts movie_titles[num-1]
  puts "Starring:"
  movie_chars[num-1].each do |link|
    data = parse_api(link)
  puts  data["name"]
end
end

#Method to see characters of each movie
def character_request(number)
  loop do
  puts "Would you like to see the cast? If so, please enter the corresponding number!"
  input = gets.chomp

  if input.to_i <= number && input.to_i > 0
    return input.to_i
  else
    puts "Invalid Input!"
  end

end
end

# parse single URL, return hash
def parse_api(link)
  movie_data ={}
  movie_url_link = RestClient.get(link)
  movie_data = JSON.parse(movie_url_link)
  # binding.pry
end






def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

# get_character_movies_from_api("luke")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
