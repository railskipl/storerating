class HomeController < ApplicationController

def index
end

def create
  
end

def business
  
end

def dashboard
  
end

def ratings
   @rating_flag = RatingFlag.find_by(user_id: current_user.id)
end

end
