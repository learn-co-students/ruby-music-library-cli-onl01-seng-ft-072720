class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
  end 
  
  def songs 
    @songs
  end 
  
   def add_song(song)
    if song.genre == nil
      song.genre = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end
  
  def artists 
    songs.map do |song|
      song.artist
    end.uniq
  end
  
end 