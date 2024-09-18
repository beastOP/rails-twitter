class HomeController < ApplicationController
  def index
    authenticate_user!
    # Get the the users that the current user is following
    # and get their tweets
    # populate the users for the tweets
    @tweets = current_user.followers_tweets.order(created_at: :desc).includes(:user)
    puts @tweets.inspect
  end
end
