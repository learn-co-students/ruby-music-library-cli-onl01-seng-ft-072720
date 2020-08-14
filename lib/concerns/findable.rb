module Concerns::Findable
  # Module code here
  
  
   def find_by_name(name)
  result = nil 
  self.class.each do |i|
    result = i if i.name == name 
  end
  result
end
  
  
  
end