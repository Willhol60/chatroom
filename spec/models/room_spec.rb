require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create(:room) }

  describe 'associations' do
    it 'belongs to a statement' do
      expect(room).to have_many(:messages)
    end
  end
end
