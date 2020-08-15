class MusicImporter 
  attr_accessor :path
  
  @@files = []
  
  def initialize(path)
  
    @path = path 
  end 
  # Dir.glob(@path).each do|f|
 
  
  def files
      ff = []
    fff = []
    
 # Dir.glob(@path).each do|f|
  Dir.entries(@path).each do |f|
    ff.push(f)
   end
   # binding.pry
   ff.each do |i|
  fff.push(i) if i[-1] == "3"
 end
   #binding.pry
    @@files = fff
    #@files = @@files
#binding.pry
 #binding.pry
  end
  
  def self.import 
    
  end
  
  
end