module DashboardHelper
	def flag(b)
	   rating_flag =  RatingFlag.find_by(business_user_id: b.id,user_id: current_user.id).inspect rescue nil 
	  if rating_flag.nil?
		link_to "Flag As Inappropriate" ,{:controller => "admin/rating_flags", :action => "create",:business => b},:method => :post
	   else
	   	"Already Flagged"
	   end
	end
end
