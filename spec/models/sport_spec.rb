require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :sport}
  end

  describe 'Relationships' do
    it {should have_many :events}
  end
end
