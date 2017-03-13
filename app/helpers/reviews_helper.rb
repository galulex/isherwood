module ReviewsHelper

    def render_review_conditionally
        if @review.user == current_user 
        render :partial => 'author'
        else 
        render :partial => 'reader'
        end 
    end
    
    def render_like_conditionally
        if user_signed_in?
        like_toggler
        else
        link_to '<i class="glyphicon glyphicon-heart-empty"></i>'.html_safe, new_user_session_path
        end
    end
    
    def like_toggler
        if current_user.liked? @review
            link_to '<i class="glyphicon glyphicon-heart"></i>'.html_safe, dislike_review_path(@review), 
            class: 'vote', method: :put, remote: true, data: { toggle_text: "<i class='glyphicon glyphicon-heart-empty'></i>".html_safe, toggle_href: like_review_path(@review), id: @review.id }
        else
            link_to '<i class="glyphicon glyphicon-heart-empty"></i>'.html_safe, like_review_path(@review), 
            class: 'vote', method: :put, remote: true, data: { toggle_text: "<i class='glyphicon glyphicon-heart'></i>".html_safe, toggle_href: dislike_review_path(@review), id: @review.id }
        end
    end
    

    def number_of_comments
        @review.comments.count
    end
        
    def render_comments_count
      if number_of_comments.zero?
        'Be the first to comment'
      else
        "#{number_of_comments} #{'comment'.pluralize(number_of_comments)}"
      end
    end
    
end