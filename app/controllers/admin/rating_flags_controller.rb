class Admin::RatingFlagsController < ApplicationController
  before_filter :authenticate_admin!, :except => :create
layout 'admin'
  def index
  	 @rating_flags = RatingFlag.all
  end

  def create
  	RatingFlag.create(user_id: current_user.id)
  	redirect_to :back
  end

  def status
	@rating_flag = RatingFlag.find(params[:id])
	@rating_flag.status = !@rating_flag.status?
    @rating_flag.save!
   	redirect_to :back 
end
end
