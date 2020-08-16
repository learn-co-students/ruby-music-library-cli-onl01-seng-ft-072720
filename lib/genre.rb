class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs 
   @@all = []
   
  def initialize(name)
    @name = name 
    @songs = []
   @@all.push(self)
 end
 
 def self.all
   @@all
 end
 
 def self.destroy_all
   @@all = []
 end
 
 def save
    self.class.all << self 
  end
  
  def self.create(name)
  s = self.new(name)
  #s.name = name
  s.save
  s 
end
  
   def add_genre(song)
       self.songs.push(song) if !self.songs.include?(song)
        song.genre = self if song.genre == nil 
    end
  
  def artists 
    sss = []
    ss = Song.all.select {|song| song.genre == self}
    ss.each do |i|
      sss.push(i.artist)
    end
    sss.uniq 
  end
  
end