class Genre
  attr_accessor :name
   @@all = []
   
  def initialize(name)
    @name = name 
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
  
end