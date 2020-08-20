require 'pry'

class Artist
    
    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable

    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
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

    def self.create(artist_name)
        new_artist = Artist.new(artist_name)
        new_artist.save
        new_artist
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        
        if self.songs.include?(song) == false
            self.songs << song
        end
    end

    def genres
        genre_arr =  self.songs.collect do |songs|
            songs.genre
        end 
        genre_arr.uniq
    end

end