class CommentsController < ApplicationController 

def index
  @comments = Comment.all
end

def new
  @comment = Comment.new
end
  
	
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



