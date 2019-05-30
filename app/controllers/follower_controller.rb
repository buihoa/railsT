class FollowerController < ApplicationController
  def followers
    @title = t("titles.follower")
    @user = User.find_by(id: params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render :show_follow
  end
end
