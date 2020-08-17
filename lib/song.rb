require 'pry'

class Song
    
    attr_accessor :name, :artist
   
    @@all = []

    def initialize(name, artist = nil)
        @name = name
        @artist = artist
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
        artist_inst.add_song
    end
        
        
end