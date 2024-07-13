class AddTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.references :user
      t.text :content
      t.string :url
      t.integer :like_count
      t.integer :reply_count
      t.integer :retweet_count
      t.timestamps
    end
  end
end
