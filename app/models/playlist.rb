class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, :dependent => :destroy

  validates :user_id, :presence => true

  def can_modify?(user)
    self.user == user
  end
end
