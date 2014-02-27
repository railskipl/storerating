class DashboardController < ApplicationController
	layout 'application'

  def index
    role_id = Role.find_by(name: "business").id
    user_role = Role.find_by(name: "customer").id
    @business = User.where(role_id: role_id)
    #Fetch Nearby Locations
    user = User.near(current_user.to_coordinates,10)
    #Rejecting user which is having roles Customers
    business_user = user.reject {|i| i.role_id == user_role }
    #Fetching business user ids
    user_id ||= []
    user_id << business_user.map { |e| e.id  }
    user_id = user_id.flatten
    #finding business users with user id
    @business_user ||= []
    user_id.each do |i|
      @business_user << BusinessUser.find_by(user_id: i) 
    end

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
