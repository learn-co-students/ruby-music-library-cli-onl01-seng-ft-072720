class MusicImporter 
  attr_accessor :path 
  
  @@files = []
  
  def initialize(file)
    @path = file 
    @@files.push(self)
  #  binding.pry
  end
  
  def files
 @@files
 #binding.pry
  end
  
  def self.import 
    
  end
  
  
end