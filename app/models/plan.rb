class Plan
  include Mongoid::Document
  field :name, type: String
  field :price, type: Integer
  field :user_id, type: Integer
  
   belongs_to :user
   has_many :accounts
  
end
 
