class Review < ActiveRecord::Base
  belongs_to :brand
  belongs_to :user
  belongs_to :category
  has_many :photos

  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true, limit: 5

  validates :title, :description, :brand_id, :category_id, :photos, presence: true

  acts_as_votable
  acts_as_commentable
  ratyrate_rateable 'product'

  def first_photo
    photos.first.file_name.url if photos.first.present?
  end
end
