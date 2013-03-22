class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.belongs_to :playlist
      t.attachment :file
      t.timestamps
    end
  end
end
