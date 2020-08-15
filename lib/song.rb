require 'pry'
class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist_object = nil, genre_object = nil)
    @name = name 
    self.artist = artist_object if artist_object != nil
    self.genre = genre_object if genre_object != nil
  end 
  
  def save
    @@all << self 
  end 
  
   def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end 
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    find_name = self.find_by_name(name)
    if find_name == nil 
      self.create(name)
    else 
      find_name 
    end 
  end 
  
    def self.new_from_filename(filename)
    genre_name = filename.chomp!(".mp3").split(" - ")[2]
    song_title = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_title, artist, genre)
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
end 