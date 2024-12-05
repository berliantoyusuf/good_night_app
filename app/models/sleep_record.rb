class SleepRecord < ApplicationRecord
  belongs_to :user
  validates :sleep_time, :wake_time, presence: true

  before_save :calculate_duration

  private

  def calculate_duration
    self.duration = (wake_time - sleep_time).to_i
  end
end
