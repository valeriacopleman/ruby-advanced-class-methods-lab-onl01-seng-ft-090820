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
    self.all.find do |person| 
      person.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by do |name|
      name.name
    end
  end
  
  def self.new_from_filename(file)
    #rows = file.split("\n")
    
      new_file =file.split("-")
      artist_name = new_file[0]
      name = new_file[1].gsub!(".mp3")
      song = self.new
      song.name = name
      song.artist_name = artist_name
      
      song
    
  end 
  
  def self.destroy_all
    self.all.clear
  end

end
