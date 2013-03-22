class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, :dependent => :destroy

  validates_presence_of :user_id

  def is_owner?(u)
    self.user == u
  end
end
