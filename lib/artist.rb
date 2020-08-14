require 'pry'

class Artist 
  
  extend Concerns::Findable 
  
  attr_accessor :name, :songs, :genre  
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all 
    @@all.uniq 
  end 
  
  def self.destroy_all
    @@all.clear   
  end 
  
  def save
    @@all.push(self)  
  end 
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless @songs.include?(song)
  end 
  
  def genres 
    @songs.collect { |song_inst| song_inst.genre}.uniq 
  end 

   
    
  
  
  
 
  
  
  
  
  
end 