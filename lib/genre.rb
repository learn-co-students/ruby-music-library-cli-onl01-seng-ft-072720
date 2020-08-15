class Genre
  extend Concerns::Findable
	attr_accessor :name, :songs
		@@all = []
	def initialize(name)
		@name = name 
		@songs = []
		@@all << self 
	end 
	def name
		@name 
	end
	def self.all
		@@all
	end
	def self.destroy_all 
		@@all.clear
	end
	 def save
		@@all << self
	end
	def self.create(name)
	  new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  def songs
    @songs
  end
    def artists
    songs.map{|song| song.artist}.uniq
  end
end