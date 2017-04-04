class User < ActiveRecord::Base
  
  extend FriendlyId
  
  friendly_id :username, use: [:finders]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :events

  acts_as_voter
  acts_as_follower
  acts_as_followable
  mount_uploader :avatar, AvatarUploader
  
end
