class Event < ApplicationRecord
  belongs_to :sport
  validates_presence_of :event

  def medalists
    joins("JOIN olympians ON olympians.event = events.event")
    .select("olympians.*")
    .where("olympians.medal = ?", "Gold")
  end
end
