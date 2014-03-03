class Account
  include Mongoid::Document
  field :logo, type: String
  field :rating, type: Integer
  field :email, type: String
  field :plan_id, type: Integer
  field :user_id, type: Integer
  field :stripe_card_token, type: String
  # field :paypal_payment_token, type: String
  field :paypal_recurring_profile_token, type: String
  field :paypal_customer_token, type: String
  field :card_number, type: String
  field :card_code, type: String
  field :card_month, type: String
  field :PayPal, type: String
  field :token, type: String

  belongs_to :plan
  belongs_to :user


  validates_presence_of  :email

  attr_accessor :paypal_payment_token



  def save_with_payment

    if valid?
      if paypal_payment_token.present?
        account = Account.find_by(email: self.email)  rescue nil
        if account.present?
          update_with_paypal_payment(account)
        else
          save_with_paypal_payment
        end
      else
        raise paypal_payment_token.inspect
      end
    end
  end


  def paypal
    PaypalPayment.new(self)
  end

  def update_with_paypal_payment(subscribe)
    response = paypal.make_recurring
    subscribe.update_attributes :plan_id => self.plan_id, :user_id => self.user_id, :email => self.email, :paypal_customer_token => self.paypal_customer_token, :paypal_recurring_profile_token => response.profile_id
  end


  def save_with_paypal_payment
    response = paypal.make_recurring
    self.paypal_recurring_profile_token = response.profile_id
    save!
  end


  def payment_provided?
    paypal_payment_token.present?
  end


end