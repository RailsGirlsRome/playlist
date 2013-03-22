class User < ActiveRecord::Base

  class << self
    def valid_username
      @valid_username ||= /[a-zA-Z0-9\-_.]+/
    end
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates_uniqueness_of :username
  validates_format_of :username, :with => /^#{valid_username}$/

  has_one :playlist, :dependent => :destroy

  before_create :build_playlist
end
