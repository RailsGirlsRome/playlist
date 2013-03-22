class Song < ActiveRecord::Base
  attr_accessible :file
  belongs_to :playlist
  has_attached_file :file
end
