class Song < ActiveRecord::Base
  include RankedModel

  attr_accessible :file, :row_order_position
  belongs_to :playlist, :touch => true

  validates_presence_of :playlist_id

  has_attached_file :file

  ranks :row_order, :with_name => :playlist_id
end
