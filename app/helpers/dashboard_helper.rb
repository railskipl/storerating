module DashboardHelper
	def flag(b)
	   rating_flag =  RatingFlag.find_by(business_user_id: b.id,user_id: current_user.id).inspect rescue nil 
	  if rating_flag.nil?
	  	rate = Rate.find_by(rateable_id: b.id) rescue nil
	  	unless rate.nil?
	  		link_to "Inappropriate" ,{:controller => "admin/rating_flags", :action => "create",:business => b},:method => :post
	  	end
	   else
	   	"Already Flagged"
	   end
	end
end
