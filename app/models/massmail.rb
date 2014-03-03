class Massmail
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  field :email, type: String
  field :subject, type: String
  field :description, type: String
  field :choose_one,  :type => String, :default => ""
  field :status,       type: Boolean
  field :user_id, type: String
  belongs_to :user
end
