class MusicLibraryController 
  
  
  
  def initialize(path="./db/mp3s")
  
    a = MusicImporter.new(path).import
  #  a.import 
  end
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."

    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    i = 0 
    while i==0 do 
    input = gets.strip
    if input == "exit"
      i = 1 
    elsif
   input == "list songs"
        list_songs
        elsif
        input == "list artists"
        list_artists
        
        elsif
   input == "list genres"
        list_genres
        elsif
        input == "list artist"
        list_songs_by_artist
        
        elsif
  
        input == "list genre"
        list_songs_by_genre
        
        elsif
   input == "play song"
      play_song
      
        
        
        
        
        
    end  #ends If 
  end # ends While 
end # ends call 
  
def list_songs 
Song.all.uniq.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
   # binding.pry
     puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
end


def list_artists
 Artist.all.uniq.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |artist, i|
    puts "#{i}. #{artist.name}"
    end
end

def list_genres
 Genre.all.uniq.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |genre, i|
    puts "#{i}. #{genre.name}"
    end
end


def list_songs_by_artist
 puts "Please enter the name of an artist:"
 
 input = gets.strip 
 
 artist_songs = []
 all_artists_array = []
 all_artists = Artist.all 
 all_artists.each do |i|
   all_artists_array.push(i.name)
 end
   if all_artists_array.include?(input)
 all_songs = Song.all

# binding.pry

 all_songs.each do |i|
  if i.artist.name == input
      artist_songs.push("#{i.name} - #{i.genre.name}")
    end 
    
 end
 
 artist_songs.sort { |a, b| a <=> b }.each.with_index(1) do |string, i|
   puts "#{i}. #{string}"
 end
 end # ends IF all_artists_array
end # ends DEF 


def list_songs_by_genre
 puts "Please enter the name of a genre:"
 
 input = gets.strip 
 
 genre_songs = {}
 all_genre_array = []
 all_genre = Genre.all 
 all_genre.each do |i|
   all_genre_array.push(i.name)
 end
   if all_genre_array.include?(input)
 all_songs = Song.all

# binding.pry

 all_songs.each do |i|
  if i.genre.name == input
      genre_songs[i.artist.name] = i.name
    end 
    
 end
 
 # binding.pry
i = 1 
 genre_songs.sort_by { |artist, song| song }.each do |art, sn|

   puts "#{i}. #{art} - #{sn}"
i += 1 
 end

 end # ends IF all_artists_array
 
end # ends DEF 


def play_song
all_songs_array = []
all_songs = Song.all.uniq.sort { |a, b| a.name <=> b.name }
puts "Which song number would you like to play?"
input = gets.strip.to_i
if (input <= all_songs.length) && input > 0 
puts "Playing #{all_songs[input - 1].name} by #{all_songs[input - 1].artist.name}"
end #ends IF 
end #ends DEF 




 end #ends Class 