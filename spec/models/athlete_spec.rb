require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :team}
    it {should validate_presence_of :age}
    it {should validate_presence_of :sport}
    it {should validate_presence_of :total_medals_won}
    it {should validate_presence_of :weight}
    it {should validate_presence_of :sex}
  end

  describe 'Instance Methods' do
    before :each do
      @athlete_1 = create(:athlete, name: "John", team: "USA", age: 25, sport: "basketball", total_medals_won: 0, sex: "M", weight: 70)
      @athlete_2 = create(:athlete, name: "Sarah", team: "USA", age: 25, sport: "volleyball", total_medals_won: 1, sex: "F", weight: 65)
      @athlete_3 = create(:athlete, name: "George", team: "France", age: 21, sport: "running", total_medals_won: 2, sex: "M", weight: 80)
      @athlete_4 = create(:athlete, name: "Pierre", team: "France", age: 28, sport: "curling", total_medals_won: 3, sex: "M", weight: 75)
    end

    it '#youngest_olympian' do
      expect(Athlete.youngest_olympian).to eq(@athlete_3)
    end

    it '#oldest_olympian' do
      expect(Athlete.oldest_olympian).to eq(@athlete_4)
    end

    it '#total_competing_olympians' do
      expect(Athlete.total_competing_olympians).to eq(4)
    end

    it '#average_weight' do
      expect(Athlete.average_weight("F")).to eq(65.0)
      expect(Athlete.average_weight("M")).to eq(75.0)
    end

    it '#average_age' do
      expect(Athlete.average_age).to eq(24.8)
    end
  end
end
