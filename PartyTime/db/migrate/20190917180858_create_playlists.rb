class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.integer :song_id
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
