class DashboardController < ApplicationController
	layout 'application'

  def index
    role_id = Role.find_by(name: "business").id
    @business = User.where(role_id: role_id)
    # @ankit = @business.near(:coordinates => current_user.coordinates)
  end

  def follow
  	user = User.find_by(_id: params["business"])
  	current_user.follow(user)
  	redirect_to :back
  end

  def unfollow
  	user = User.find_by(_id: params["business"])
  	current_user.unfollow(user)
  	redirect_to :back
  end

end
