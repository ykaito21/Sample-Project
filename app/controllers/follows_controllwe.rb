class FollowsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :destroy]

  def create
  	user = User.find_by(username: params[:username])
  	Follow.create(followable: user, follower: current_user)
  	redirect_to_user_path(user.username), notice: "Successfully followed user"
  end

  def destroy
  	user = User.find_by(username: params[:username])
  	Follow.find_by(followable: user, follower: current_user).destroy
  	redirect_to_user_path(user.username), notice: "Successfully unfollowed user"
  end
end
