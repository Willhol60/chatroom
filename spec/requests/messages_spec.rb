# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages' do # rubocop:disable Metrics/BlockLength
  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET messages/index at root path' do
    it 'returns http success' do
      get '/'

      expect(response.status).to eq(200)
      expect(response.body).to include('Chatroom')
    end
  end

  describe 'POST /messages' do
    let(:post_request) { post '/messages', params: params }

    context 'when provid ed with no content' do
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
