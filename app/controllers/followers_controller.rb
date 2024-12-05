class FollowersController < ApplicationController
  def create
    follower = Follower.new(follower_params)
    if follower.save
      render json: { message: 'Now following user.' }, status: :created
    else
      render json: { errors: follower.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def unfollow
    follower = Follower.find_by(follower_id: params[:follower_id], following_id: params[:following_id])
    if follower&.destroy
      render json: { message: "#{params[:following_id]} has unfollowed #{params[:follower_id]}." }, status: :ok
    else
      render json: { error: 'Unable to unfollow user.' }, status: :not_found
    end
  end

  private

  def follower_params
    params.require(:follower).permit(:follower_id, :following_id)
  end
end