class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.belongs_to :playlist
      t.attachment :file
      t.timestamps
    end
    add_index :songs, :playlist_id
  end
end
