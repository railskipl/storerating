class Review
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MultiParameterAttributes
  field :body, type: String
  field :user_id, type: String
  field :reviewer_id, type: String
  belongs_to :user
  has_many :reply

  #To create review
  def self.add_review(body,user,reviewer)
    self.create( :body => body, :user_id => user,:reviewer_id => reviewer.id )
  end

end
