require 'pry'

class Song
    #include ''

    attr_accessor :name, :genre, :artist
#attr_reader :artist
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        self.name = name
        self.genre = genre
        self.artist = artist
        save
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
    Song.new(name)
end

def artist=(artist)
    if artist != nil
        @artist = artist
        artist.add_song(self)
    else
        @artist = artist
    end   
end

def genre=(genre)
    if genre != nil && genre.is_a?(Genre)
    #@genre = Genre.find_or_create_by_name(genre)
    @genre = genre
        #binding.pry
        if @genre.songs.find{|s| s.name == self.name} == nil
            @genre.songs << self
        end
    end

end

def self.find_by_name(name)
    @@all.find {|s| s.name == name}
end

def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
        self.create(name)
    else 
        self.find_by_name(name)
    end
end

def self.new_from_filename(filename)
    split = filename.split(" - ")
    split_genre = split[2].split(".")
    artist = Artist.find_or_create_by_name(split[0])
    genre = Genre.find_or_create_by_name(split_genre[0])
    self.new(split[1], artist, genre)
end

def self.create_from_filename(filename)
    self.new_from_filename(filename).save
end



end