# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages' do
  let(:user) { create(:user) }
  let(:room) { create(:room) }

  before { sign_in user }

  describe 'POST /messages' do
    let(:post_request) { post "/rooms/#{room.id}/messages", params: params }

    context 'when provided with no content' do
      let(:params) { { message: { content: nil } } }

      it 'does not create a message' do
        post_request
        expect(response).not_to have_http_status(:ok)
      end
    end

    context 'when provided with valid attributes' do
      let(:params) { { message: { content: 'Hey, new message' } } }

      it 'creates a message' do
        post_request
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
