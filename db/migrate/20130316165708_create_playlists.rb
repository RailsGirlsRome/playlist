class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.timestamps
    end

    add_index :playlists, :user_id
  end
end
