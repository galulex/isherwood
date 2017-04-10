class User < ActiveRecord::Base
  
  extend FriendlyId
  
  friendly_id :username, use: [:finders]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_uniqueness_of :username
  validates_presence_of :first_name, :username
  validates_exclusion_of :username, in: %w( admin user users explore search login signin signup ),
  message: "has already been taken"

  has_many :reviews
  has_many :events

  acts_as_voter
  acts_as_follower
  acts_as_followable
  mount_uploader :avatar, AvatarUploader
  
end
