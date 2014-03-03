class Forum
  include Mongoid::Document  
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps::Created

  has_many :comments
  field :name, type: String  
  field :published_on, type: DateTime
  field :content, type: String 
end

