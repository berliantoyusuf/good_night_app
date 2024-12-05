class User < ApplicationRecord
  has_many :sleep_records, dependent: :destroy

  # Users who follow this user
  has_many :follower_relationships, class_name: 'Follower', foreign_key: 'following_id', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  # Users this user is following
  has_many :following_relationships, class_name: 'Follower', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
end
