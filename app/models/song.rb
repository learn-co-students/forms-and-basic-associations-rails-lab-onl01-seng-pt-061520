class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end
  
  def genre_id
    genre ? genre.id : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      notes.build(content: content) if content.strip != ''
    end
  end

  def note_contents
    notes.map(&:content)
  end
end
