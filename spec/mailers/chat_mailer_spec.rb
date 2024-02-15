# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatMailer do
  let(:user1) { create(:user, email: 'user1@example.com') }
  let(:user2) { create(:user, email: 'user2@example.com') }

  before do
    user1
    user2
  end

  describe '#send_weekly_stats_email' do
    it 'sends weekly stats email to the specified user' do
      email = ChatMailer.send_weekly_stats_email(user1).deliver

      expect(email.to).to include(user1.email)
      expect(email.to).not_to include(user2.email)
      expect(email.subject).to eq('Weekly Usage Statistics')
      expect(email.body).to include('messages have been exchanged in the last week')
    end
  end
end
