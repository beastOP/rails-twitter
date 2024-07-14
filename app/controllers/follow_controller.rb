class FollowController < ApplicationController
  before_action :authenticate_user!

  def create
    following_id = params[:id]

    if Follow.exists?(user_id: current_user.id, following_id:)
      # flash[:notice] = 'You are already following this user'
      # redirect_to profile_path(id: following_id)
      begin
        ActiveRecord::Base.transaction do
          follow = Follow.find_by!(user_id: current_user.id, following_id:)
          follow.destroy!

          current_user.decrement!(:following_count)
          User.find(following_id).decrement!(:followers_count)
        end
        flash[:notice] = 'You have unfollowed this user.'
      rescue ActiveRecord::RecordNotFound => e
        flash[:alert] = "Unable to find the follow record: #{e.message}"
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = "Unable to unfollow user: #{e.message}"
      rescue StandardError => e
        flash[:alert] = "Something went wrong: #{e.message}"
      ensure
        redirect_to profile_path(id: following_id)
      end
    else
      begin
        ActiveRecord::Base.transaction do
          follow = Follow.create!(user_id: current_user.id, following_id:)
          raise ActiveRecord::RecordInvalid unless follow.persisted?

          current_user.increment!(:following_count)
          User.find(following_id).increment!(:followers_count)
        end
        flash[:notice] = 'You are now following this user.'
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = "Unable to follow user: #{e.message}"
      rescue StandardError => e
        flash[:alert] = "Something went wrong: #{e.message}"
      ensure
        redirect_to profile_path(id: following_id)
      end
    end
  end
end
