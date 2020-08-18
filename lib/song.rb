require 'pry'

class Song
    
    attr_accessor :name
    attr_reader :artist, :genre
   
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist = artist
        end

        if genre != nil
            self.genre = genre
        end
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

    def self.create(song_name)
        new_song = Song.new(song_name)
        new_song.save
        new_song
    end

    def artist=(artist_inst)
        @artist = artist_inst
        artist_inst.add_song(self)
    end

    def genre=(genre_inst)
        @genre = genre_inst
        if genre_inst.songs.include?(self) == false
            genre_inst.songs << self
        end
    end

    def self.find_by_name(song_name)
        self.all.find {|song| song.name == song_name}
    end

    def self.find_or_create_by_name(song_name)
        find = self.find_by_name(song_name)
        if find == nil
            self.create(song_name)
        else
            find    
        end
    end

    def self.new_from_filename(filename)
        artist_name = filename.split(" - ")[0]        
        song_title = filename.split(" - ")[1]
        genre_name = filename.split(" - ")[2]
        genre_name.gsub!(".mp3", "")
        song = Song.find_or_create_by_name(song_title)
        artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        artist.add_song(song) 
        song
     end

     def self.create_from_filename(filename)
       new_song = self.new_from_filename(filename)
       new_song.save
     end

     
               
end

