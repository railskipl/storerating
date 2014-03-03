class Admin::EventsController < ApplicationController

before_filter :authenticate_admin!, :except => []
layout 'admin'



def index
 @events=Event.all
end


def status
	@event = Event.find(params[:id])
	@event.status = !@event.status?
    @event.save!
    if @event.status == true
      redirect_to dashboard_index_path
    end
	redirect_to admin_events_path
end


end
