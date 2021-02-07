# * Define your `Song` class such that an individual song is initialized with a name, artist and genre.
# * There should be an `attr_accessor` for those three attributes.
# * Create a class variable, `@@count`. We will use this variable to keep track of the number of new songs that are created from the `Song` class. Set this variable equal to `0`.
# * At what point should we increment our `@@count` of songs? Whenever a new song is created. Your `#initialize` method should use the `@@count` variable and increment the value of that variable by `1`.
# * Write a class method, `.count`, that returns the total number of songs created.
# * Write a class method, `.genres` that returns an array of all of the genres of existing songs. This array should contain only unique genres––no duplicates! Think about what you'll need to do to get this method working.
#   * You'll need a class variable, let's call it `@@genres`, that is equal to an empty array.
#   * When should you add genres to the array? Whenever a new song is created. Your `#initialize` method should add the genre of the song being created to the `@@genres` array. All genres should be added to the array. Control for duplicates when you code your `.genres` class method, not when you add genres to the original `@@genres` array. We will want to know how many songs of each genre have been created. We'll revisit that job a little later on.

# * Write a class method, `.artists`, that returns an array of all of the artists of the existing songs. This array should only contain unique artists––no repeats! Once again think about what you need to do to implement this behavior.
#   * You'll need a class variable, let's call it `@@artists`, that is equal to an empty array.

#   * When should you add artists to this array? Whenever a new song is intialized. Your `#initialize` method should add artists to the `@@artists` array.  All artists should be added to the array.  Control for duplicates when you code your `.artists` class method, not when you add artists to the original `@@artists` array.  

#We will want to know how many songs each have been assigned to each artist.  We'll revisit that job a little later on when we write our `.artist_count` method.

# * Write a class method, `.genre_count`, that returns a hash in which the keys are the names of each genre. Each genre name key should point to a value that is the number of songs that have that genre.
require "pry"

# * Define your `Song` class such that an individual song is initialized with a name, artist and genre.
class Song

# * Create a class variable, `@@count`. We will use this variable to keep track of the number of new songs that are created from the `Song` class. Set this variable equal to `0`.
    @@count = 0
    @@genres = []
    @@artists = []

# * There should be an `attr_accessor` for those three attributes.
    attr_accessor :name, :artist, :genre 

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre

# * At what point should we increment our `@@count` of songs? Whenever a new song is created. Your `#initialize` method should use the `@@count` variable and increment the value of that variable by `1`.
        @@count += 1
        @@genres << genre
        @@artists << artist
    end

# * Write a class method, `.count`, that returns the total number of songs created.
    def self.count 
        @@count 
    end 
# * Write a class method, `.genres` that returns an array of all of the genres of existing songs. This array should contain only unique genres––no duplicates! Think about what you'll need to do to get this method working.

    def self.genres
        @@genres.uniq
    end 

    def self.artists
        @@artists.uniq
    end 

    def self.artist_count
        artist_count = {}
        @@artists.each do |artist|
            if artist_count[artist]
                artist_count[artist] += 1
            else 
                artist_count[artist] = 1
            end 
        end 
        artist_count
    end 

# * Write a class method, `.genre_count`, that returns a hash in which the keys are the names of each genre. Each genre name key should point to a value that is the number of songs that have that genre.
    def self.genre_count
        genre_count = {}
        @@genres.each do |genre|
            if genre_count[genre]
                genre_count[genre] += 1 
            else
                genre_count[genre] = 1
            end
        end 
        genre_count
    end
end 

#binding.pry 