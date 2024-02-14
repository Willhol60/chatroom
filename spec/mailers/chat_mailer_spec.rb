# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe ChatMailer do
  let(:user1) { create(:user, email: 'user1@example.com') }
  let(:user2) { create(:user, email: 'user2@example.com') }

  before do
    user1
    user2
  end

  describe '#send_weekly_stats_email' do
    it 'sends weekly stats email to all users' do
      email = ChatMailer.send_weekly_stats_email.deliver

      expect(email.to).to include(user2.email)
      expect(email.subject).to eq('Weekly Usage Statistics')
      expect(email.body).to include('messages have been exchanged in the last week')
    end
  end
end
