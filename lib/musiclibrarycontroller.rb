require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
   importer = MusicImporter.new(path)
   importer.import
  end
  def call
    input = ''
      while input != 'exit'
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
      input = gets.chomp
  
  case input 
  when "list songs"
    self.list_songs
  when "list artists"
    self.list_artists
  when "list genres"
    self.list_genres
  when "list artist"
    self.list_songs_by_artist
  when "list genre" 
    self.list_songs_by_genre
  when "play song"
      self.play_song
    end 
  end
end
      

  def list_songs
    Song.all.uniq.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
  def list_artists
    Artist.all.uniq.sort{|a, b| a.name <=> b.name}.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}" 
    end
  end
  def list_genres
    Genre.all.uniq.sort{|a,b| a.name <=> b.name}.each_with_index do |g,i|
      puts "#{i+1}. #{g.name}"
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp 
    
    if artist = Artist.find_by_name(input)
      artist.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |s,i|
      puts "#{i+1}. #{s.name} - #{s.genre.name}"
    end
    end 
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |s,i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    
    if input > 0 && input <= Song.all.length 
      array = Song.all.uniq.sort{|a,b| a.name <=> b.name}
      song_info = array[input-1]
      puts "Playing #{song_info.name} by #{song_info.artist.name}" unless song_info == nil 
    end
    #puts "Playing #{song.name} by #{song.artist.name}" #unless song == nil
  end
end

"1. Thundercat - For Love I Come - dance"
"2. Real Estate - Green Aisles - country"
"3. Real Estate - It's Real - hip-hop"
"4. Action Bronson - Larry Csonka - indie"
"5. Jurassic 5 - What's Golden - hip-hop"
