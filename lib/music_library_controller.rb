class MusicLibraryController

  attr_accessor :path
  @input = ""
  @library = ""

  def initialize(path = './db/mp3s')
    @path = path
    # binding.pry
    @library = MusicImporter.new(@path).import
  end

  def call
    until @input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      @input = gets.chomp
    end
  end

  def list_songs
    songs = Song.all.sort_by{|s| s.name}
    songs.each.with_index(1){|s, i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    artists_to_parse = []
    artists = Artist.all.sort_by{|s| s.name}
    artists.each.with_index(1){|s, i| puts "#{i}. #{s.name}"}
  end



end
