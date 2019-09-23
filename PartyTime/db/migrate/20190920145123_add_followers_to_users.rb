class AddFollowersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :followers, :integer
  end
end
