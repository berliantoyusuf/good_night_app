# spec/models/follower_spec.rb
require 'rails_helper'

RSpec.describe Follower, type: :model do
  let(:user1) { User.create(name: 'Alice') }
  let(:user2) { User.create(name: 'Bob') }

  it 'is valid with valid attributes' do
    follower = Follower.new(follower_id: user1.id, following_id: user2.id)
    expect(follower).to be_valid
  end

  it 'is not valid without follower_id' do
    follower = Follower.new(follower_id: nil, following_id: user2.id)
    expect(follower).not_to be_valid
  end

  it 'is not valid without following_id' do
    follower = Follower.new(follower_id: user1.id, following_id: nil)
    expect(follower).not_to be_valid
  end
end