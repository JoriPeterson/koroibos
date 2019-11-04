class Athlete < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :team
  validates_presence_of :age
  validates_presence_of :sport
  validates_presence_of :total_medals_won

  def self.youngest_olympian
    order(age: :asc).first
  end

  def self.oldest_olympian
    order(age: :desc).first
  end
end
