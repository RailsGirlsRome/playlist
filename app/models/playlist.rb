class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, :dependent => :destroy

  def is_owner?(u)
    self.user == u
  end
end
