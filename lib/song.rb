class Song 
  extend Concerns::Findable
 # extend Findable
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
  #s.save
 # s 
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
  
    
  # THIS ONE WORKED 
  def self.find_or_create_by_name(name)
  part_one = self.find_by_name(name)
  #binding.pry
  if part_one == nil 
   self.create(name)
  else part_one 
 end
end
  
    # THIS ONE WORKED 
  def self.find_by_name(name)
  result = nil 
  @@all.each do |i|
    result = i if i.name == name 
  end
  result
 end
  
  
  def self.create_from_filename(filename)
self.new_from_filename(filename)
 end



  
  def self.new_from_filename(file)
    f = file.split(" - ")
   song_name = f[1]
   artist_name = f[0]
   genre_name = f[2].gsub(".mp3", "")
   # binding.pry
   
  
   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)
   
   
   self.new(song_name, artist, genre)
   
  # artist.add_song(song)
   
   #self.new(song, artistt)
   #self.create(song, artist=artistt)
   #artist.name = artistt
   #Artist.create(self)
   
  # if find_by_name(song) == false
  # a =   self.new(song, artistt)
  #self.new(song)
#else
  #file 
   # end 
  #  self.find_or_create_by_name(song)
    
   # self.new(song, artistt)
 # artistt.add_song(song)
 #artist=(artistt)
 # a = artist=(artistt)
 # song = Song.find_or_create_by_name(song_name)
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