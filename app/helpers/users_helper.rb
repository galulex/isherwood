module UsersHelper    
    
def render_follow_conditionally
  if user_signed_in?
    follow_toggler 
    else
    button_to "Follow", new_user_session_path, class: 'follow-button btn btn-lake'
  end
end

def follow_toggler
  if current_user.following? @user
    button_to "Following", unfollow_user_path(@user), class: 'btn follow-button btn-lake'
    elsif current_user.id != @user.id
    button_to "Follow", follow_user_path(@user), class: 'btn follow-button btn-lakeside'
    end
  end
end