class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Add the following line to the User model:

  has_many :follows, foreign_key: 'user_id'
  has_many :followers, through: :follows, source: :following
  has_many :tweets
  def followers_tweets
    Tweet.where(user_id: followers.pluck(:id))
  end
end
