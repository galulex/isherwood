class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end
  
  def index
    @users = User.all
    render(json: @users, each_serializer: UserSerializer)
  end
  
  def follow
  @user = User.find(params[:id])

  if current_user
    if current_user == @user
      flash[:error] = "You cannot follow yourself."
    else
      current_user.follow(@user)
      flash[:notice] = "You are now following #{@user.username}."
    end
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.username}.".html_safe
  end
end

def unfollow
  @user = User.find(params[:id])

  if current_user
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following #{@user.username}."
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.username}.".html_safe
  end
end
  
end
