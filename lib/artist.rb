require 'pry'
require_relative "../config/environment.rb"
class Artist
   extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        self.name = name
        self.songs = []
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
    self.new(name)
end

def add_song(song) 
    song.artist == nil ? song.artist = self : nil
    if self.songs.find {|s| s == song} == nil
    self.songs << song
end
#binding.pry
end

def genres
    genre_array = songs.map {|s| s.genre}
    genre_array.uniq
end






end

