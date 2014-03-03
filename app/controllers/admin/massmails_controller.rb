class Admin::MassmailsController < ApplicationController

before_filter :authenticate_admin!, :except => []
layout 'admin'
	def index
		@massmails = Massmail.all
	end


def status
	@massmail = Massmail.find(params[:id])
	@massmail.status = !@massmail.status?
    @massmail.save!
    if @massmail.status == true
      MassmailMailer.registration_confirmation(@massmail).deliver
    end
	redirect_to admin_massmails_path
end

end
