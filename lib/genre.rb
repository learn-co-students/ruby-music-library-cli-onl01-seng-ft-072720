require 'pry'

class Genre  
  
  extend Concerns::Findable 
  
  attr_accessor :name, :songs, :artist 
  
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
    @@all << self 
  end 
  
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save 
    new_genre
  end 
  
  def artists 
    @songs.map { |song_inst| song_inst.artist }.uniq   
  end 
  


  
end 