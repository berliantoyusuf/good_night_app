# spec/controllers/followers_controller_spec.rb
require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  let(:user1) { User.create(name: 'Alice') }
  let(:user2) { User.create(name: 'Bob') }

  describe 'POST #create' do
    it 'creates a follower relationship' do
      post :create, params: { follower: { follower_id: user1.id, following_id: user2.id } }
      expect(response).to have_http_status(:created)
      expect(Follower.count).to eq(1)
    end

    it 'returns an error when parameters are invalid' do
      post :create, params: { follower: { follower_id: nil, following_id: user2.id } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #unfollow' do
    it 'destroys the follower relationship' do
      Follower.create(follower_id: user1.id, following_id: user2.id)
      delete :unfollow, params: { follower_id: user1.id, following_id: user2.id }
      expect(response).to have_http_status(:ok)
      expect(Follower.count).to eq(0)
    end

    it 'returns an error when the relationship does not exist' do
      delete :unfollow, params: { follower_id: user1.id, following_id: user2.id }
      expect(response).to have_http_status(:not_found)
    end
  end
end