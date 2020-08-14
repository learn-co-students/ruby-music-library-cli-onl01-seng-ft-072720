class Song 
  attr_accessor :name, :artist, :genre
   @@all = []
   
  def initialize(name, artist=nil, genre=nil)
    @name = name 
   @@all.push(self)
   if artist !=nil then self.artist=(artist)
   end
      if genre !=nil then self.genre=(genre)
      end
   

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
 
    def genre=(genre)
      @genre = genre
    genre.add_genre(self)
   # self.artist = Artist.add_song(song)
   #binding.pry
  end
    
    def artist=(artist)
      @artist = artist 
    artist.add_song(self)
   # self.artist = Artist.add_song(song)
   #binding.pry
  end
  
    
  
  def self.find_or_create_by_name(name)
  part_one = self.find_by_name(name)
  #binding.pry
  if part_one == nil 
   
    part_two = self.create(name)
  else part_one 
  end
end
  
  
  def self.find_by_name(name)
  result = nil 
  @@all.each do |i|
    result = i if i.name == name 
  end
  result
end
  
  
end

 # def self.find_or_create_by_name(name)
     #   aa = []
      #  if @@all.detect{|i| i.name == name}
      #    aa.push(@@all.detect{|i| i.name == name})
      #   aa.uniq 
        # @@all.detect{|i| i.name == name}
     #   binding.pry
  # else
   #   self.new(name)
      # self.name
   # end
 # end

 
   # def artist=(artist)
  #   artist.add_song(self)
  #  end