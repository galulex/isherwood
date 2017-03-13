class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  

  # GET /reviews
  # GET /reviews.json
  
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
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
     @comments = @review.comments.all
  end
  
   def new_comment
    review = Review.find_by(id: params[:id])
    comment = review.comments.build(comment_params)
  end
  
  # GET /reviews/new
  def new
    @review = Review.new
    authorize @review
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
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

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
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

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to user_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
      authorize @review
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :description, :brand_id)
    end
    
    def comment_params
      params.permit(:comment)
    end
    
end

