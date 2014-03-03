class DashboardController < ApplicationController
  layout 'application'

  def index
    @forums = Forum.all
    role_id = Role.find_by(name: "business").id
    user_role = Role.find_by(name: "customer").id
    @business = User.where("role_id" => role_id)
    @rating_flag = RatingFlag.find_by(user_id: current_user.id) rescue nil

    #Fetch Nearby Locations
    if current_user.to_coordinates.blank?
     user = User.near([0,0],10000)
    else
     user = User.near(current_user.to_coordinates,10)
    end 
    #Rejecting user which is having roles Customers
    business_user = user.reject {|i| i.role_id == user_role }
    #Fetching business user ids
    user_id ||= []
    user_id << business_user.map { |e| e.id }
    user_id = user_id.flatten
    #finding business users with user id
    @business_user ||= []
    user_id.each do |i|
      @business_user << BusinessUser.find_by(user_id: i)
    end


    @business_user = @business_user.sort_by{|e| -e[:avg] }
    #@ankit = @business.near(:coordinates => current_user.coordinates)
  end

  def show
    @business = User.find(params[:id])
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

  def post_review
    if params[:body].present? && params[:user_id].present?
      @review = Review.add_review(params[:body],params[:user_id],current_user)
      if @review.save
        @success = "Review Saved Successfully !!!"
      end
    else
      @error = "Please Enter Text In Body !!!"
    end
  end 


end
