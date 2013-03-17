class Song < ActiveRecord::Base
  attr_accessible :file

  belongs_to :playlist
  has_attached_file :file, {
    :storage        => :s3,
    :s3_credentials => YAML.load(ERB.new(File.read(Rails.root + 'config/s3.yml.erb')).result(binding)),
    :bucket         => "rgr13-playlist",
    :path           => "/npj/:class/:attachment/:id_partition/:style/:filename"
  }

  validates :playlist_id, :presence => true
  validates_attachment :file, :presence => true
end
