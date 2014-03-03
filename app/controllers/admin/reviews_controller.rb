class Admin::ReviewsController < ApplicationController

before_filter :authenticate_admin!, :except => []
layout 'admin'

def index
	@reviews= Review.all.to_a
end

def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
end

end
