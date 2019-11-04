require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :team}
    it {should validate_presence_of :age}
    it {should validate_presence_of :sport}
    it {should validate_presence_of :total_medals_won}
  end
end
