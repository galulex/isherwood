class CommentsController < ApplicationController 
    def new 
        @review = Review.find(params[:review_id])
    end 

    def create 
        @review = Review.find(params[:review_id]) 
        @comment = @review.comments.create(comment_params) 
        @comment.user_id = current_user.id 
        
        if @comment.save
           @comment.create_activity :create, owner: current_user
           redirect_to :back
        end
        
    end 

    private 

    def comment_params 
        params.require(:comment).permit(:comment)
    end
 end 