class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre

    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        instance = self.new(name)
        instance.save
        instance
    end

    def artist=(artist)
        @artist = artist
        if artist.class == Artist
        artist.add_song(self) if self.artist != nil
        end
    end

    def genre=(genre)
        @genre = genre
        if genre != nil && genre.class == Genre
        genre.songs << self if !genre.songs.include?(self)
        end
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if !self.find_by_name(name)
            self.create(name)
        else
            self.find_by_name(name)
        end
    end

    def self.new_from_filename(file_name)
        song_name = file_name.split(" - ")[1]
        artist_name = file_name.split(" - ")[0]
        genre_name = file_name.split(" - ")[2].gsub(".mp3", "")

        artist_object = Artist.find_or_create_by_name(artist_name)
        genre_object = Genre.find_or_create_by_name(genre_name)
        Song.new(song_name, artist_object, genre_object)
    end

    def self.create_from_filename(file_name)
        @@all << Song.new_from_filename(file_name)
    end

end