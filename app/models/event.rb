class Event < ApplicationRecord
  belongs_to :sport
  validates_presence_of :event
end
