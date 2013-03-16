class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates :username, :presence => true, :uniqueness => true

  has_one :playlist

  before_create :build_playlist
end
