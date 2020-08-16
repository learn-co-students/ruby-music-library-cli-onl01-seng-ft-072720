class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save 
    artist 
  end 
  
  def add_song(song)
    song.artist = self if song.artist == nil 
    @songs << song if !@songs.include?(song)
  end
  
  def songs 
    @songs
  end
  
  def genres 
    self.songs.map { |song| 
    song.genre}.uniq 
  end
  
end