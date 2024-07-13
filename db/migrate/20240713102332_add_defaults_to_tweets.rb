class AddDefaultsToTweets < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:tweets, :like_count, 0)
    change_column_default(:tweets, :reply_count, 0)
    change_column_default(:tweets, :retweet_count, 0)
    change_column_default(:tweets, :url, '')
    change_column_null(:tweets, :user_id, false)
    change_column_null(:tweets, :content, false)
  end
end
