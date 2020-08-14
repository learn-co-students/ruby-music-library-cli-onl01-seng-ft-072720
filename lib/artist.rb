require 'pry'
class Artist 
  attr_accessor :name, :songs, :genre
   @@all = []
   
  def initialize(name)
    @name = name 
   @@all.push(self)
   @songs = []
   @genre = []
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
   
 def songs
   @songs
 end
  
 
  
 def genres
    s = []
  g = Song.all.select {|song| song.artist == self}
 g.each do |i|
   s.push(i.genre)
   # binding.pry 
   # if i.artist == self 
   #   s.push(i)
  end
  s.uniq
end 
#end
# s 
  #end

  
  def add_song(song)
        self.songs.push(song) if !self.songs.include?(song)
        song.artist = self if song.artist == nil 
    end
  
  
  
end
  
#def add_song(new_song)
#  ss = []
#  s = Song.all 
 # s.each do |i|
#    #binding.pry
#    if i.name == new_song.name
#      ss.push(i)
##    end
#  end
#  if ss == []
#     new_song.artist = self
#  @songs.push(new_song)
#
#ss.each do |i|
#  if i.artist.length == 0 
# new_song.artist = self
#  @songs.push(song)
#end
#end
#end 

 # self.artist = Artist.find_or_create_by_name(name)
# s = []
# songs = Song.all.select {|songg| songg.artist == self}
 # songs = Song.all.each do |i|
 #   binding.pry 
 #   if i.artist == self 
 #     s.push(i)
 # end
#end
 # songs
 # binding.pry 
 #if Song.all.include?(name) == false 
#binding.pry 
#end
  
 # def songs
 #   s = []
  #songs = Song.all.select {|song| song.artist == self}
 # songs = Song.all.each do |i|
 #   binding.pry 
 #   if i.artist == self 
 #     s.push(i)
 # end
#end
 # songs
 # end

 #def genres 
 #   @genre
  #end

