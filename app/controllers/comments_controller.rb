class CommentsController < ApplicationController
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create!(params[:comment])
    redirect_to :back, :notice => "Comment created!"  
  end  

   

  def count 
  	@topic = Topic.find(params[:topic_id])
  	@comment = @topic.comments.count(params[:comment]) 
  end  
end 



