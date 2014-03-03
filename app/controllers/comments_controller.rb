class CommentsController < ApplicationController
  
	def create
    @forum = Forum.find(params[:forum_id])
    @comment = @forum.comments.create!(params[:comment])
    redirect_to @forum, :notice => "Comment created!"  
  end



   

  def count 
  	@forum = forum.find(params[:forum_id])
  	@comment = @forum.comments.count(params[:comment]) 
  end  
end 



