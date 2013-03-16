class Song < ActiveRecord::Base
  attr_accessible :file

  belongs_to :playlist
  has_attached_file :file

  validates :playlist_id, :presence => true
  validates_attachment :file, :presence => true
end
