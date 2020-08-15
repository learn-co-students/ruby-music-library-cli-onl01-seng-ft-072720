class MusicLibraryController 
  
  attr_accessor :path 
  
  def initialize(path="./db/mp3s")
    @path = path
    a = MusicImporter.new(path)
    a.import 
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
    end 
  end

  
def list_songs 
    instance_list = Song.all
   
   new_instance = []
  
   instance_list.collect do |i|
      new_instance.push([i.name, i.artist.name, i.genre.name])
    end 
   alph = new_instance.sort
   
   ##  binding.pry

   i = 1 
   alph.each do |j|
     puts "#{i}. #{j[1]} - #{j[0]} - #{j[2]}"
    i += 1 
    end
  end
end
  
  end