class AddPlaylistToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :playlist_id, :integer
  end
end
