class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def new
    @user = User.new
    @user.avatars.build
  end

  def index
    @users = User.all
    render(json: @users, each_serializer: UserSerializer)
  end

  def follow
    @user = User.find(params[:id])
    if current_user
      current_user.follow(@user)
      redirect_to user_path(@user.id, anchor: "profile-header")
    end
  end

  def update
    current_user.update_attributes(user_params)
    redirect_to user_path(current_user)
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user
      current_user.stop_following(@user)
      redirect_to user_path(@user.id, anchor: "profile-header")
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :avatar_cache)
  end
end
