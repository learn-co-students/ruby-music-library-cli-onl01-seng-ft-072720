class Song
	attr_accessor :name, :genre, :musicimporter, :musiclibrarycontroller
	attr_reader :artist
		@@all = []
	def initialize(name, artist=nil, genre=nil)
		@name = name 
		if artist !=nil then self.artist =(artist)
    if genre !=nil then self.genre =(genre)
		@@all << self
		end
		end
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
	  new_song = self.new(name)
    new_song.save
    new_song
  end
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  def genre
    @genre
  end
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else 
      self.create(song_name)
    end
  end
    def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
    end
    def self.create_from_filename(filename)
    self.new_from_filename(filename).save
    end
end 