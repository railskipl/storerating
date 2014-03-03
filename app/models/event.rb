class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MultiParameterAttributes
  field :event_name, type: String
  field :date, type: DateTime
  field :description, type: String
  field :tel, type: String
end
