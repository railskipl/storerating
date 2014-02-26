class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(curent_user)
  role = Role.find(curent_user.role_id)
  if role.name == "business"
    plans_path
   else
   	dashboard_index_path
   end
  

 end
end
