class TweetController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params.require(:tweet).permit(:content))
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:success] = 'New tweet successfully added!'
      redirect_to root_path
    else
      flash.now[:error] = 'Tweet creation failed'
      render :new
    end
  end
end
