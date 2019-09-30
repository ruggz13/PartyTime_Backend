class RemoveDescriptionFromPlaylist < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlists, :description, :text
  end
end
