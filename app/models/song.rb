class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  has_many :notes
  belongs_to :artist


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end 

 
end
