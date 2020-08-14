class Artist 
 
 extend Concerns::Findable
 
  attr_accessor :name, :genres
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear 
  end
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end
  
  def songs
    @songs
  end
  
  def genres
    songs.collect {|song|
    song.genre}.uniq
  end

end