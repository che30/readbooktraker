require 'rails_helper'

RSpec.describe "Measurments", type: :request do
  let(:user) { create(:user) }
  let!(:measurements) { create_list(:measurement, 10,pages_read: 10,user_id: user.id) }
  let(:measurement_id) { measurements.first.id }
  let(:headers) { valid_headers }
  describe 'GET /measurements' do
    before { get '/measurements', params: {}, headers: headers }
  end
  describe 'GET /measurements/:id' do
    before { get "/measurements/#{measurements_id}", params: {}, headers: headers }
    end
    describe 'POST /measurements' do
      let(:valid_attributes) do
        # send json payload
        { pages_read: 10,user_id: 2,measurment: {pages_read: 50} }.to_json
      end
      context 'when request is valid' do
        before { post "/users/#{1}/measurements", params: valid_attributes, headers: headers }
        # [...]
      end
      context 'when the request is invalid' do
        let(:invalid_attributes) { { pages_read: nil }.to_json }
        before { post "/users/#{2}/measurements", params: invalid_attributes, headers: headers }
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Pages_read can't be blank/)
      end
    end
    describe 'PUT /measurements/:id' do
      let(:valid_attributes) { { pages_read: 20 }.to_json }
  
      context 'when the record exists' do
        before { put "/measurements/#{measurement_id}", params: valid_attributes, headers: headers }
        # [...]
      end
    end
    describe 'DELETE /measurements/:id' do
      before { delete "/measurements/#{measurement_id}", params: {}, headers: headers }
      # [...]
    end
end
