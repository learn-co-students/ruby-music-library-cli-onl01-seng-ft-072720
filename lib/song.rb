require 'pry'

class Song
  
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.genre = genre if genre != nil 
    self.artist = artist if artist != nil
    save 
  end 
  
  def self.all
    @@all.uniq 
  end 
  
  def self.destroy_all
    @@all.clear   
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save 
    new_song
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
 def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end
  
  def self.find_by_name(name)
      self.all.detect do |songs| 
      songs.name == name 
     end 
  end 
  
  def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end
  
  def self.new_from_filename(filename)
    file_parts = filename.gsub(/(\.mp3)/, "")  
    file_split = file_parts.split(" - ")
    artist = Artist.find_or_create_by_name(file_split[0])
    song = Song.find_or_create_by_name(file_split[1])
    genre = Genre.find_or_create_by_name(file_split[2])
    song.artist = artist 
    song.genre = genre 
    song 
  end 
  
  def self.create_from_filename(filename)
    new_file = Song.new_from_filename(filename)
    new_file.save 
  end 
  
  # binding.pry 
 
  

 
 


  
  
end 

# binding.pry 

  
 




  


  
  
  
  

  
  
  
  
