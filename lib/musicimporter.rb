class MusicImporter 

attr_accessor :path
  
def initialize(file_name) 
   @path = file_name
end 
 
def files
 @files = Dir.entries(@path)
 @files.delete_if {|file| file == "." || file == ".."}
end 
  
def import  
  files.each{|f| Song.create_from_filename(f)}
end 

  
end 