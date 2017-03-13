class PhotosController < ApplicationController
  before_action :set_review, only: [:create]
  
  def index
    @photos = Photo.all
  end

 def create
    @photo = Photo.new(file_name: params[:file], review_id: @review.id)
    if @photo.save!
      render json: @photo
    else
      puts 'Hello'
      render json: { error: 'Failed to process' }, status: 422
    end
  end

  def delete_photo
 @photo = Photo.find(params[:id])
  @photo.destroy
   redirect_to :back
  end
  
  
  private
  
  def set_review
    @review = Review.find(params[:review_id])
  end
end
