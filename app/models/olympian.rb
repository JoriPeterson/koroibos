class Olympian < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :team
  validates_presence_of :age
  validates_presence_of :sport
  validates_presence_of :weight
  validates_presence_of :sex
  validates_presence_of :total_medals_won
  validates_presence_of :medal

  def self.youngest_olympian
    order(age: :asc).first
  end

  def self.oldest_olympian
    order(age: :desc).first
  end

  def self.total_competing_olympians
    select(:name).count
  end

  def self.average_weight(sex)
    select(:sex).where("sex = ?", sex).average(:weight).round(1).to_f
  end

  def self.average_age
    average(:age).round(1).to_f
  end

  def self.all_medalists(event_id)
    select(:id, :name, :team, :age, :medal, :event, "events.id")
    .joins("JOIN events ON olympians.event = events.event")
    .where("events.id = ?", event_id)
    .where(medal: ["Gold","Silver","Bronze"])
  end
end
