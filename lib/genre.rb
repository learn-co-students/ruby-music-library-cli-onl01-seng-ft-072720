require_relative './song'
require_relative './artist'

class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
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
    inst = self.new(name).tap {|inst| inst.save}
  end

  def songs
    @songs
  end

  def artists
    genres = Song.all.select{|s| s.genre}
    genres.collect{|a| a.artist}.uniq
  end


end
