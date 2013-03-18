class Song < ActiveRecord::Base

  include RankedModel

  attr_accessible :file, :row_order_position

  belongs_to :playlist, :touch => true

  if Rails.env.development?
    has_attached_file :file
  else
    has_attached_file :file, {
      :storage        => :s3,
      :s3_credentials => YAML.load(ERB.new(File.read(Rails.root + 'config/s3.yml.erb')).result(binding)),
      :bucket         => "rgr13-playlist",
      :path           => "/npj/:class/:attachment/:id_partition/:style/:filename"
    }
  end

  validates :playlist_id, :presence => true
  validates_attachment :file, :presence => true

  ranks :row_order, :with_name => :playlist_id
end
