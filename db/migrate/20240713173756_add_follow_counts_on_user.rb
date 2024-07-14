class AddFollowCountsOnUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :following_count, :integer, default: 0
    add_column :users, :followers_count, :integer, default: 0
  end
end
