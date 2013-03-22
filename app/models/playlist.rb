class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, :dependent => :destroy

  validates_presence_of :user_id

  class << self
    def from_param(username)
      where(:user_id => User.where(:username => username)).first
    end
  end

  def is_owner?(u)
    self.user == u
  end

  def to_param
    self.user.username
  end
end
