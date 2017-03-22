class Avatar < ActiveRecord::Base
   mount_uploader :avatar_file, AvatarUploader
    belongs_to :user

  validates :avatar_file, presence: true
end
