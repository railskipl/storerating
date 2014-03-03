class ReviewsController < ApplicationController

  def index
    @level = get_level current_user.accounts
    @reviews = current_user.reviews
  end

  def post_reply
    if params[:body].present? && params[:replier_id].present?
      @replies = Reply.add_reply(params[:body],current_user,params[:replier_id],params[:review_id])
      if @replies.save
        @success = "Review Saved Successfully !!!"
      end
      @error = "Please Enter Text In Body !!!"
    end
  end

end
