require 'pry'

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        @path = path
        miobject = MusicImporter.new(path)
        miobject.import
    end

    def call
        input = ""

        while input != "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"

        input = gets.strip

        case input
            when "list songs"
            list_songs
            when "list artists"
            list_artists
            when "list genres"
            list_genres
            when "list artist"
            list_songs_by_artist
            when "list genre"
            list_songs_by_genre
            when "play song"
            play_song
            end
        end
    end
        
    def list_songs
        songs_list = Song.all.sort{|a,b| a.name <=> b.name}
        # songs_list = songs_list.uniq
        songs_list.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artist_list = Artist.all.sort{|a,b| a.name <=> b.name}
        artist_list = artist_list.uniq
        artist_list.each_with_index do |artist, i|
            puts "#{i+1}. #{artist.name}"
        end
    end

    def list_genres
        genre_list = Genre.all.sort{|a,b| a.name <=> b.name}
        genre_list = genre_list.uniq
        genre_list.each_with_index do |genre, i|
            puts "#{i+1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.chomp
        songs_artist = Song.all.select do |song| 
            song.artist.name == input
        end
        sorted = songs_artist.sort {|a,b| a.name <=> b.name}
        sorted = sorted.uniq 
        sorted.each_with_index do |song, i|
            puts "#{i + 1}. #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp
        songs_genre = Song.all.select do |song| 
            song.genre.name == input
        end
        sorted = songs_genre.sort {|a,b| a.name <=> b.name}
        sorted = sorted.uniq
        sorted.each_with_index do |song, i|
            puts "#{i + 1}. #{song.artist.name} - #{song.name}"
        end
    end

    def play_song 
        puts "Which song number would you like to play?"
        input = gets.chomp
        songs_list = Song.all
        songs_list = songs_list.uniq
        if input.to_i > 0 && input.to_i <= songs_list.length
           songs_list = songs_list.sort{|a,b| a.name <=> b.name}
        puts "Playing #{songs_list[input.to_i - 1].name} by #{songs_list[input.to_i - 1].artist.name}"
        end
    end

end