class FollowingController < ApplicationController
  def following
    @title = t("titles.follow")
    @user = User.find_by(id: params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    render :show_follow
  end
end
