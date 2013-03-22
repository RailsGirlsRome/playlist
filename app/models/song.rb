class Song < ActiveRecord::Base
  belongs_to :playlist
  has_attached_file :file
end
