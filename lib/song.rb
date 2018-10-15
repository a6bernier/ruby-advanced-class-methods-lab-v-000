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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      if song.name == name
        song
      else
        false
      end
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) #if class Song uses the find_by_name methods and matches the variable name to a song within @all...
      self.find_by_name(name) #find and print the song name
    else
      self.create_by_name(name) #else create a new song by name and print
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.collect do |data|
      parsed = data.split(", ")
      name = data[0]
      title = data[1]
      filetype = data[2]
      self.create_by_name(name)
      self.create_from_filename(title, filetype)
  end


end
