class Sport < ApplicationRecord
  has_many :events
  validates_presence_of :sport
end
