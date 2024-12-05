# spec/models/sleep_record_spec.rb
require 'rails_helper'

RSpec.describe SleepRecord, type: :model do
  let(:user) { User.create(name: 'Alice') }

  it 'is valid with valid attributes' do
    sleep_record = SleepRecord.new(
      user: user,
      sleep_time: Time.now - 8.hours,
      wake_time: Time.now
    )
    expect(sleep_record).to be_valid
  end

  it 'is not valid without sleep_time' do
    sleep_record = SleepRecord.new(user: user, sleep_time: nil, wake_time: Time.now)
    expect(sleep_record).not_to be_valid
  end

  it 'is not valid without wake_time' do
    sleep_record = SleepRecord.new(user: user, sleep_time: Time.now - 8.hours, wake_time: nil)
    expect(sleep_record).not_to be_valid
  end

  it 'is not valid without a user' do
    sleep_record = SleepRecord.new(sleep_time: Time.now - 8.hours, wake_time: Time.now)
    expect(sleep_record).not_to be_valid
  end
end