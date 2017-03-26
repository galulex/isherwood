class Review < ActiveRecord::Base
  
  searchkick
    
  belongs_to :brand
  belongs_to :user
  belongs_to :category
  has_many :photos

  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  validates :title, :description, :brand_id, :category_id, :photos, presence: true

  acts_as_votable
  acts_as_commentable

  def first_photo
    photos.first.file_name.url if photos.first.present?
  end
  
  def avatar
    user.avatars.first.avatar_file.url if user.avatars.first.present?
  end
  
end
