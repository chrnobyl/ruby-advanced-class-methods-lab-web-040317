require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	song = Song.new
  	song.save
  	return song
  end

  def self.new_by_name(name)
  	song = Song.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = Song.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	@@all.each do |el|
  		if el.name == name
  			return el
  		end
  	end
  end

  def self.find_or_create_by_name(name)
  	if Song.all.include?(name) 
  		Song.find_by_name(name)
  	else
  		Song.create_by_name(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by!{|el| el.name}
  	
  end

  def self.new_from_filename(filename)
  	songname = filename.split("- ").last
  	songname = songname.split(".")[0]
    artistname = filename.split("-")[0]
    artistname = artistname.split(" ")[0]
  	song = Song.new
  	song.name = songname
    song.artist_name = artistname
  	song
  	
  end

  def self.create_from_filename(filename)
    songname = filename.split("- ").last
    songname = songname.split(".")[0]
    artistname = filename.split("-")[0]
    artistname = artistname.split(" ")[0]
    song = Song.new
    song.name = songname
    song.artist_name = artistname
    song.save
    song

    
  end

  def self.destroy_all
    @@all.clear
    
  end



end
