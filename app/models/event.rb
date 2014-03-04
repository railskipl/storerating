class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MultiParameterAttributes
  field :event_name, type: String
  field :date, type: Date
  field :description, type: String
  field :tel, type: Integer
  field :status,       type: Boolean
  validates_numericality_of :tel

end
