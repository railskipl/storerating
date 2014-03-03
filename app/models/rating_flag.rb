class RatingFlag
  include Mongoid::Document
  field :user_id
  field :business_user_id
  field :status, type: Boolean, default:false
  belongs_to :business_user
  belongs_to :user
end
