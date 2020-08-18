require 'pry'

class Genre
    
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

    def self.create(genre_name)
        new_genre = Genre.new(genre_name)
        new_genre.save
        new_genre
    end

    def artists
        artists_arr =  self.songs.collect do |songs|
            songs.artist
        end
        artists_arr.uniq
    end

end