class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        self.name = name
        @songs = []
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

    def artists
        self.songs.map{|song| song.artist}.uniq
    end

end