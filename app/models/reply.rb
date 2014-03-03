class Reply
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MultiParameterAttributes
  field :body, type: String
  field :user_id, type: String
  field :review_id, type: String
  field :replier_id, type: String
  belongs_to :user
  belongs_to :review

  def self.add_reply(body,user,replier, review)
    self.create(:body => body, :user_id => replier ,:replier_id => user.id,:review_id => review)
  end


end
