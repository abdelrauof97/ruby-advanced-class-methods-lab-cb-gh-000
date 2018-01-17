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
    self.all.detect { |x| x.name == name }
  end
  
  def self.find_or_create_by_name(song_name)
    self.create_by_name(name) || self.find_by_name(name)
  end
  
  def self.alphabetical 
    self.all.sort_by { |k|
      k.name 
    }
  end
  
  def self.new_from_filename(song)
    new_instant = self.new 
    song_split = song.split(/.-.|[.]/).reject{ |x| x == "mp3" }
    new_instant.artist_name = song_split[0]
    new_instant.name = song_split[1]
    new_instant
  end
  
  def self.create_from_filename(song)
    new_instant = self.create
    song_split = song.split(/.-.|[.]/).reject{ |x| x == "mp3" }
    new_instant.artist_name = song_split[0]
    new_instant.name = song_split[1]
    new_instant
  end
  
  def self.destroy_all
    self.all.clear
  end
    
end









