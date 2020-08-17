require_relative "../config/environment.rb"
class Genre
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
    self.new(name)      #?save when?????
end

def artists
    artist_array = songs.map {|s| s.artist}
    artist_array.uniq
end





end