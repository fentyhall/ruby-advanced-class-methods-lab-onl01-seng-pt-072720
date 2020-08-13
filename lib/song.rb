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
    song = self.new 
    song.save
    song     
  end 

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song   
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name 
    song 
  end 

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end 

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if self.find_by_name(song_name)
      song
    else 
      self.create_by_name(song_name)
    end 
    #self.find_by_name(song_name) || self.create_by_name(song_name)
  end 

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end 

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    full_song = data[1].split(".")
    name = full_song[0]

    song = self.new 
    song.artist_name = artist_name 
    song.name = name 
    song 
  end 

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename) 
  end 

  def self.destroy_all
    self.all.clear 
  end 
end