class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :reviews
  has_many :events
  has_many :avatars

  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  
  acts_as_voter
  acts_as_follower
  acts_as_followable
end
