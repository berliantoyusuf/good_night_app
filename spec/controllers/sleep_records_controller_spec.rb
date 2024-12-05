# spec/controllers/sleep_records_controller_spec.rb
require 'rails_helper'

RSpec.describe SleepRecordsController, type: :controller do
  let(:user) { User.create(name: 'Alice') }

  describe 'POST #create' do
    it 'returns an error when parameters are invalid' do
      post :create, params: { user_id: user.id, sleep_record: { sleep_time: nil, wake_time: Time.now } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end