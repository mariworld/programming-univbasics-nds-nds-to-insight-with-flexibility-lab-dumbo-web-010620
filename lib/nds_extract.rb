# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
    #binding.pry
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  dir_name = name
  i = 0 
  mov_array=[]
  while i < movies_collection.length do
    mov_hash = movie_with_director_name(dir_name, movies_collection[i])
    mov_array << mov_hash
    i += 1
  end
  mov_array
end

 # GOAL: For each Hash in a movies_collection (an array), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
def gross_per_studio(collection)
  i = 0 
  mov_hash = {}
  while i < collection.length do
   #{"Alpha Films" => 40, "Omega Films" => 10}
    stu_name = collection[i][:studio]
    if mov_hash.key?(stu_name)
      mov_hash[stu_name] += collection[i][:worldwide_gross]
    else
      mov_hash[stu_name] = collection[i][:worldwide_gross]
    end
    binding.pry
    i += 1
  end
  mov_hash
end
#set a key inside new Hash
#if hash includes studio key
#else set it equal to worldwide_gross
# GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

def movies_with_directors_set(source)
  i = 0
  dir_movies = []
  while i < source.length do
    mov_hash = source[i]
    director_name = source[i][:name]
    movies = source[i][:movies]
    dir_movies << movies_with_director_key(director_name, movies)
    #binding.pry
    i += 1
  end
  dir_movies
end

 #j = 0
  # while j < source[i][:movies].length do
  #   mov_hash = {}
  #   mov_hash[:director_name] = source[i][:name]
  #   mov_hash[:name] = source[i][:movies][j][:title]
  #   dir_movies << mov_hash
  #   j += 1
  #   #binding.pry
   #end
# GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
