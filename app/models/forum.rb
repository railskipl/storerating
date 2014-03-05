class Forum
  include Mongoid::Document  
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps::Created

  has_many :comments 
  belongs_to :user 
  field :user_id, type: String
  field :name, type: String  
  field :published_on, type: Date
  field :content, type: String   
  validates_presence_of :name, :content
end

