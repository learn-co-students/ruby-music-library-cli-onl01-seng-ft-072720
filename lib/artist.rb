class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        self.name = name
        self.songs= []
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

    def add_song(song)
        self.songs << song if !self.songs.include?(song)
        song.artist = self if song.artist == nil
    end

    def genres
        self.songs.map{|song| song.genre}.uniq
    end
end