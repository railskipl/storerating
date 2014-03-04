class PlansController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user
  def index
    @plans = Plan.all
    @account = Account.find_by(user_id: current_user.id ) rescue nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plans }
    end
  end
  
    def new
    @plans = Plan.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plans }
    end
  end
  
  
  

  def show
    @plans = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plans }
    end
  end

  def edit
    @plans = Plan.find(params[:id])
  end
  
  def create
    @plans = Plan.new(params[:plan])

    respond_to do |format|
      if @plans.save
        format.html { redirect_to plans_path, notice: 'Plan was successfully created.' }
        format.json { render json: @plans, status: :created, location: @plans }
      else
        format.html { render action: "new" }
        format.json { render json: @plans.errors, status: :unprocessable_entity }
      end
    end


  
  def update
    @plans = Account.find(params[:id])

    respond_to do |format|
      if @plans.update_attributes(params[:plan])
        format.html { redirect_to @plans, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plans.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
      @plans = Plan.find(params[:id])
      @plans.destroy

      respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
   end  
 end 

 def correct_user
  role = Role.find_by(name: "customer").id
  redirect_to dashboard_index_path if current_user.role.id == role
 end

end 
