class Comment
  include Mongoid::Document  
  include Mongoid::Timestamps::Created

  belongs_to :topic 


  field :name, type: String
  field :content, type: String 
 
end
