class Admin::EventsController < ApplicationController

before_filter :authenticate_admin!, :except => []
layout 'admin'



def index
 @events=Event.all
end


end
