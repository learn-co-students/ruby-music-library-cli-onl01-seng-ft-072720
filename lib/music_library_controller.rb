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
    else
      i = 0 
    end  #ends If 
  end # ends While 
end # ends call 
  
def list_songs 
list = Song.all.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
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

binding.pry

 all_songs.each do |i|
   artist_songs.push(i.name) if i.artist.name == input
 end
 
 artist_songs.each do |i|
   puts "#{i}"
 end
 end # ends IF all_artists_array
 
 
end # ends DEF 


 end #ends Class 