class MassmailsController < ApplicationController


  def index
    @massmails = Massmail.all
  end

# def new
# 	@massmail = Massmail.new
# end

  def new
    @level = get_level current_user.accounts
    #@level = 2
    #binding.pry
    if @level >=2
      @massmail = Massmail.new
      @customers =  Role.where(:name => "customer").first.users.where(:location => current_user.location).to_a
    else
      flash[:alert] = "You are Not Authorized for Mass Mailing."
      redirect_to :back
    end

  end

  def create
    @massmail = Massmail.new(params[:massmail])

    respond_to do |format|
      if @massmail.save
        format.html { redirect_to @massmail, notice: 'Massmail was successfully created.' }
        format.json { render json: @massmail, status: :created, location: @massmail }
      else
        format.html { render action: "new" }
        format.json { render json: @massmail.errors, status: :unprocessable_entity }
      end
    end
  end

# def approve_user
#   user = Massmail.find(params[:massmail])
#   user.approved = true
#   if user.save
#      MassmailMailer.registration_confirmation(@massmail).deliver
#   else
#     flash[:alert] = "#{user.full_name} approval failure"
#   end
#   redirect_to :back
# end
# <% if comment.status %>
end
