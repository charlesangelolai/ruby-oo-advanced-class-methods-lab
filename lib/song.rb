require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find { |person| person.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      object = []

      @@all.each do |object_song|
        if object_song.name == name
          object = object_song
        end
      end

      object
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(file_name)
    file_name = parse_file(file_name)
    self.create_by_name_and_artist(file_name.last, file_name.first)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.create_by_name_and_artist(name, artist)
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.parse_file(file_name)
    file_name = file_name.gsub(".mp3","").split(" - ")
  end

  def self.destroy_all
    @@all.clear
  end
end
