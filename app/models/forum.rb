class Forum
  include Mongoid::Document 
  include Mongoid::MultiParameterAttributes  
  has_many :topics, :dependent => :destroy
  field :title, type: String 
  field :description, type: String

end
