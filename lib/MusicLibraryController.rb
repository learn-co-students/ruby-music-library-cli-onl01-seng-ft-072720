class MusicLibraryController
    attr_accessor :path
    
    def initialize(filename = "./db/mp3s")
        self.path = filename
            MusicImporter.new(self.path).import
    end

        def call
            until input = exit
            puts "Welcome to your music library!"
            puts"To list all of your songs, enter 'list songs'."
            puts"To list all of the artists in your library, enter 'list artists'."
            puts"To list all of the genres in your library, enter 'list genres'."
            puts"To list all of the songs by a particular artist, enter 'list artist'."
            puts"To list all of the songs of a particular genre, enter 'list genre'."
            puts"To play a song, enter 'play song'."
            puts"To quit, type 'exit'."
            puts"What would you like to do?"
            input = gets
            end
        end

        def list_songs
            songs.all.each_with_index(1) do |s, i|
                puts "#{i}. #{s}"
            end
        end


end