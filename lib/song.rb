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
    self.all << song
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
    song = self.all.detect {|song| song.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    alphabetical_sort = self.all.sort_by {|song| song.name}
    alphabetical_sort
  end

  def self.new_from_filename(filename)
    songs = filename.split(" - ")
    songs[1] = songs[1].chomp(".mp3")
    song = self.new
    song.name = songs[1]
    song.artist_name = songs[0]
    song
  end

  def self.create_from_filename(filename)
    results = self.new_from_filename(filename)
    song = self.create
    song.name = results.name
    song.artist_name = results.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
