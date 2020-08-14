class Artist
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
	  new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  def songs 
    @songs
  end 
  def add_song(song)
    if Song.all.find {|song| song.artist == self}
      nil 
    else
      @songs << song
    song.artist = self
  end
  end
end