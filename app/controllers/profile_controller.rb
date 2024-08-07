class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :set_user, only: %i[edit update]

  def show
    @user = (User.find(params[:id]) if params[:id])
    @my_tweets = Tweet.where(user_id: params[:id]) if params[:id]

    @following = if Follow.exists?(user_id: current_user.id, following_id: params[:id])
                   true
                 else
                   false
                 end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path(id: @user.id), notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(%i[name bio username])
  end
end
