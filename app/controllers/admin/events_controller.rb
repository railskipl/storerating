class Admin::EventsController < ApplicationController

before_filter :authenticate_admin!, :except => []
layout 'admin'

def index
 @events=Event.all
end


def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :back
end

 def status
	@event = Event.find(params[:id])
	@event.status = !@event.status?
    @event.save!
    redirect_to :back 
   end


end
