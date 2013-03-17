class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, :touch => true, :dependent => :destroy

  validates :user_id, :presence => true

  class << self
    def by_param(username)
      where(:user_id => User.where(:username => username)).first
    end
  end

  def can_modify?(user)
    self.user == user
  end

  def to_param
    self.user.username
  end
end
