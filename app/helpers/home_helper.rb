module HomeHelper
	def flag
	  unless @rating_flags.nil?
		link_to "Flag As Inappropriate" ,{:controller => "admin/rating_flags", :action => "create"},:method => :post
	   else
	   	""
	   end
	end
end
