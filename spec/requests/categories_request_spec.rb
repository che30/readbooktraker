
require 'rails_helper'
require 'faker'

RSpec.describe 'Categories', type: :request do
  let(:user) { create(:user) }
  let!(:categories) do
    create_list(:category, 10, name: Faker::Name )
  end
  # let(:measurement_id) { measurements.first.id }
  let(:headers) { valid_headers }
  describe 'GET /api/categories' do
    before { get '/api/categories', params: {}, headers: headers }
    it 'returns measurements' do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end
  end
end
