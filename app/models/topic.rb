class Topic
  include Mongoid::Document   
  include Mongoid::MultiParameterAttributes 
  belongs_to :forum 
  has_many :comments, :dependent => :destroy
  field :title, type: String 
  field :description, type: String 
  field :forum_id, type: String  

end
