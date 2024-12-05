class SleepRecordsController < ApplicationController
  def create
    sleep_record = SleepRecord.new(sleep_record_params)
    if sleep_record.save
      render json: sleep_record, status: :created
    else
      render json: { errors: sleep_record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    user = User.find(params[:user_id])
    render json: user.sleep_records.order(created_at: :asc)
  end

  private

  def sleep_record_params
    params.require(:sleep_record).permit(:user_id, :sleep_time, :wake_time)
  end
end
