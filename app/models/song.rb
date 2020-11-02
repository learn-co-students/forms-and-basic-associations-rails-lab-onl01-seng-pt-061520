class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(notes)
    notes.each do |note|
      if !note.empty? 
        note = Note.find_or_create_by(content: note)
        self.notes << note
      end
    end
  end

end
