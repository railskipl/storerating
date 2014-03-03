class Comment 
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::MultiParameterAttributes
  field :name, type: String
  field :content, type: String 
  belongs_to :forum
  
end
