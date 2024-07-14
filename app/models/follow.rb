class Follow < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'user_id', required: true
  belongs_to :following, class_name: 'User', foreign_key: 'following_id', required: true
end
