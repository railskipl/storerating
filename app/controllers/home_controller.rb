class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]
  before_filter :correct_user, :only => [:dashboard]

def index
end

def create
  
end

def business
  
end

def dashboard
  
end

private 

def correct_user
  role = Role.find_by(name: "customer").id
   redirect_to dashboard_index_path if current_user.role.id == role
end
end
