class FollowingSleepRecordsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    followings = user.followings
    records = SleepRecord
              .where(user: followings)
              .where('created_at >= ?', 1.week.ago)
              .order(duration: :desc)

    render json: records
  end
end
