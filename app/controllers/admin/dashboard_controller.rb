class Admin::DashboardController < ApplicationController

 before_filter :authenticate_admin!, :except => []
  layout 'admin'

  def index
  end

  def users
  	@users = User.all
  end

  def suspend
  	number =  params["no"].to_i
  	user = params["user"]
  	if number == 0
  	 redirect_to :back ,:alert => "Add Number of days"
  	else
  	 u = User.find(user)
  	 u.suspend = number
  	 u.save
  	 redirect_to admin_users_path ,:alert => "#{u.email} suspended for #{number} days"
  	end
  end

end
