# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_713_173_756) do
  create_table 'follows', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'following_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['following_id'], name: 'index_follows_on_following_id'
    t.index ['user_id'], name: 'index_follows_on_user_id'
  end

  create_table 'tweets', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.text 'content', null: false
    t.string 'url', default: ''
    t.integer 'like_count', default: 0
    t.integer 'reply_count', default: 0
    t.integer 'retweet_count', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_tweets_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.string 'bio'
    t.string 'username'
    t.integer 'following_count', default: 0
    t.integer 'followers_count', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'follows', 'users'
  add_foreign_key 'follows', 'users', column: 'following_id'
end
