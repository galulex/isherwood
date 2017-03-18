class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def like
    @review = Review.find(params[:id])
    @review.liked_by current_user
    if request.xhr?
      render json: { count: @review.get_likes.size, id: params[:id] }
    else
      redirect_to @review
    end
  end

  def dislike
    @review = Review.find(params[:id])
    @review.disliked_by current_user
    if request.xhr?
      render json: { count: @review.get_likes.size, id: params[:id] }
    else
      redirect_to @review
    end
  end

  def index
    @reviews = Review.all
    authorize @reviews

    top_review_ids = [1,2,5]
    @top_reviews = Review.find(top_review_ids)
    favorite_review_ids = [8,2,5]
    @favorite_reviews = Review.find(favorite_review_ids)
    new_review_ids = [1,2,5]
    @new_reviews = Review.find(new_review_ids)
  end

  def show
    @comments = @review.comments.all
  end

  def new_comment
    review = Review.find_by(id: params[:id])
    comment = review.comments.build(comment_params)
  end

  def new
    @review = Review.new
    @review.photos.build
    authorize @review
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    authorize @review

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:title, :description, :brand_id, :category_id,
                                  photos_attributes: [:file_name, :_destroy])
  end

  def comment_params
    params.permit(:comment)
  end
end

