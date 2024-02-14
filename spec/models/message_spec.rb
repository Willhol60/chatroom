# frozen_string_literal: true

RSpec.describe Message do
  let(:message) { Message.create(user: user, content: 'Hey!') }
  let(:user) { create(:user) }

  describe 'associations' do
    it 'belongs to a statement' do
      expect(message).to belong_to(:user)
    end
  end

  describe 'validations' do
    it 'validates presence of content' do
      message.content = nil
      expect(message).to_not be_valid
    end
  end
end
