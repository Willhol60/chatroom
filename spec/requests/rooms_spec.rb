require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let(:user) { create(:user) }
  let(:room) { create(:room) }

  before { sign_in user }

  describe 'GET rooms/show' do
    it 'returns http success' do
      get "/rooms/#{room.id}"

      expect(response.status).to eq(200)
      expect(response.body).to include(room.name)
    end
  end
end
