class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new

    @account = Account.new(:user_id => current_user.id, :token => params[:token])

    #raise @account.inspect
    # @plan = current_user.id
    # @plan =params[:plan_id]
    plan = Plan.find(params[:plan_id])
    @account = plan.accounts.build
    if params[:PayerID]
      @account.user_id = params[:user_id]
      @account.paypal_customer_token = params[:PayerID]
      @account.paypal_payment_token = params[:token]
      # raise @account.paypal_payment_token.inspect
      @account.email = @account.paypal.checkout_details.email

    end
  end

  # GET /accounts/1/edit
  def edit
    @account = current_user.account
  end

  # POST /accounts
  # POST /accounts.json

  def create
    @account = Account.new(params[:account])
    if @account.save_with_payment
      redirect_to @account, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json

  def update
    @account = current_user.account
    if @account.update_stripe
      redirect_to edit_account_path, :success => 'Updated Card.'
    else
      flash.alert = 'Unable to update card.'
      render :edit
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

  def plan

  end

  def paypal_checkout
    plan = Plan.find(params[:plan_id])
    account = plan.accounts.build
    redirect_to account.paypal.checkout_url(
                    return_url: new_account_url(:plan_id => plan.id,:user_id => current_user.id),
                    cancel_url: root_url
                )
  end

  private
  def paypal
    PaypalPayment.new(self)
  end

  def payment_provided?

  end

  def paypal_payment_token

  end

end
