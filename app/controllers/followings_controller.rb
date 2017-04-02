class FollowingsController < ApplicationController

def index
    @user = current_user
end

end