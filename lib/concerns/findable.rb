module Concerns::Findable
  # Module code here
  
  
   def find_by_name(name)
     
     self.all.detect{|o| o.name == name}
     
     
     # WHY DOESN'T THIS FOLLOWING PART OF THE LAB WORK???  Why can't I call .each ???
     
  #result = nil 
  #self.class.each do |i|
  #  result = i if i.name == name 
  #end
  #result
end
  
  # THIS ONE WORKED 
  def find_or_create_by_name(name)
  part_one = self.find_by_name(name)
  #binding.pry
  if part_one == nil 
   self.create(name)
  else part_one 
  end
end

  def create(name)
  s = self.new(name)
 
end

end