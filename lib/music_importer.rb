class MusicImporter
    attr_accessor :path, :files

    def initialize(path)
        @path = path
        @files = Dir.entries(path).find_all{|file| file.end_with?(".mp3")}
    end

    def files
        @files
    end

    def import
        files.each{|file| Song.create_from_filename(file)}
    end
end