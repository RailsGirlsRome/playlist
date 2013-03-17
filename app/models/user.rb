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

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates :username, :presence => true, :uniqueness => true
  validates_format_of :username, :with => /^#{valid_username}$/, :message => "may contain only letters, numbers, dashes, dots, and underscores. No spaces."

  has_one :playlist

  before_create :build_playlist
end
