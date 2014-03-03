class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
 #  def after_sign_in_path_for(curent_user)
 #  role = Role.find(curent_user.role_id)
 #  if role.name == "business"
 #    plans_path
 #   else
 #   	dashboard_index_path
 #   end
  

 # end

   def after_sign_in_path_for(curent_user) 
       if current_user.nil?
       admin_dashboard_path
       else
       role = Role.find(curent_user.role_id)
      if role.name == "business"
       plans_path
       else
       dashboard_index_path
      end
    end

end

end
