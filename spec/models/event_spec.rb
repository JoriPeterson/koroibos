require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :event}
  end

  describe 'Relationships' do
    it {should belong_to :sport}
  end
end
