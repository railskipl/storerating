class Event
  include Mongoid::Document
  field :event_name, type: String
  field :date, type: String
  field :description, type: String
  field :tel, type: String
end
