class AddRowOrderToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :row_order, :integer, :null => false, :default => 0
  end
end
