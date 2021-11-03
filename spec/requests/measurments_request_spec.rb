require 'rails_helper'

RSpec.describe "Measurments", type: :request do
  let(:user) { create(:user) }
  let(:cat) { Cat.create!(name: 'science fiction') }
  let(:book) { Book.create!(name: 'think grow rich',
    author: 'steve',isbn:'1267',number_of_pages: 20,cat_id: cat.id)}
  let!(:measurements) { create_list(:measurement, 10,pages_read: 10,
    user_id: user.id,book_id: book.id) }
  let(:measurement_id) { measurements.first.id }
  let(:headers) { valid_headers }
  describe 'GET /measurements' do
    before { get '/measurments', params: {}, headers: headers }
    it 'returns measurements' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
  end
end
  describe 'GET /measurements/:id' do
   before { get "/measurments/#{measurement_id}", params: {}, headers: headers }
   context 'when the record exists' do
    it 'returns the measurement' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(measurement_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
   end
  #  describe 'POST /measurements' do
  #    let(:valid_attributes) do
  # #       # send json payload
  #      { pages_read: 10,user_id: 2,book_id: book.id }.to_json
  #    end
  #    context 'when request is valid' do
  #      before { post "/measurements", params: valid_attributes, headers: headers }
  #      # [...]
  #     end
  #     context 'when the request is invalid' do
  #       let(:invalid_attributes) { { pages_read: nil }.to_json }
  #       before { post "/users/#{2}/measurements", params: invalid_attributes, headers: headers }
  #     end
  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #   it 'returns a validation failure message' do
  #     expect(json['message'])
  #       .to match(/Validation failed: Pages_read can't be blank/)
  #   end
  # end
  # describe 'PUT /measurements/:id' do
  #   let(:valid_attributes) { { pages_read: 20 }.to_json }
  
  #   context 'when the record exists' do
  #     before { put "/measurements/#{measurement_id}", params: valid_attributes, headers: headers }
  #     # [...]
  #   end
  # end
  # describe 'DELETE /measurements/:id' do
  #   before { delete "/measurements/#{measurement_id}", params: {}, headers: headers }
  #   # [...]
    
  # end
end
