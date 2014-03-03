class RatingFlag
  include Mongoid::Document
  field :user_id
  field :status, type: Boolean, default:false
  belongs_to :user
end
