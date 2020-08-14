class Song 
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear 
  end
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
    genre.songs << self
  end
end

  def self.find_by_name(name) 
    @@all.find {|song|
    song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
      artist_name = file.split(" - ")[0]
      song_name = file.split(" - ")[1]
      genre_name = file.split(" - ")[2].chomp(".mp3")
      song = self.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
     song
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end


end
