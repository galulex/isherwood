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
    @favorite_reviews = Review.where(favorite: true)
    @top_reviews = Review.where(top: true)
    @new_reviews = Review.where(new: true)
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
    authorize @review
    @all_categories = Category.where(id: [1001, 1002, 1003, 1004, 1005, 2002, 2003, 2004, 2005, 2006])
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.friendly.find(params[:id])
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
    @comment = @review.comments.find(params[:id])
    @comment.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_review
    @review = Review.friendly.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:title, :description, :brand_id, :category_id,
                                  photos_attributes: [:id, :file_name, :file_name_cache, :_destroy])
  end

  def comment_params
    params.permit(:comment)
  end
  
  before_filter :set_category
  def set_category
  @all_categories = Category.where(id: [1001, 1002, 1003, 1004, 1005, 2002, 2003, 2004, 2005, 2006])
  end
  
end

