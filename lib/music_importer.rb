class MusicImporter 

    attr_accessor :path, :files

    def initialize(path)
        @path = path
    end

    def files
        # @files || Dir.glob("#{path}/*.mp3).collect {|path|
        #     path.gsub("#{path}/", "") }
        @files || Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
    end
    

end