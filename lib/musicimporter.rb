class MusicImporter
    attr_accessor :path

    def initialize(filename)
        self.path = filename
    end

    def files
        Dir.glob("#{path}/*.mp3").map do |e|
        e2 = e.split("/")
        e2.last
        #binding.pry
    end
    end

    def import
        files.each {|f| Song.create_from_filename(f)}
    end




end
