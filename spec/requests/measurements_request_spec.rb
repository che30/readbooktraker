require 'rails_helper'
require 'faker'

RSpec.describe 'Measurments', type: :request do
  let(:user) { create(:user) }
  let(:cat) { Category.create!(name: 'science fiction') }
  let(:book) do 
    Book.create!(name: Faker::Name,
                author: Faker::Name.name,
                isbn: Faker::Number.number(digits: 4).to_s,
                number_of_pages: Faker::Number.number(digits: 3),
                category_id: cat.id,
                user_id: user.id)
  end
  let!(:measurements) do
    create_list(:measurement, 10, 
                  pages_read: 10,
                  user_id: user.id,
                  book_id: book.id,
                  date: Date.today.to_s)
  end
  let(:measurement_id) { measurements.first.id }
  let(:headers) { valid_headers }
  describe 'GET /api/user-measurements' do
    before { get '/api/user-measurements', params: {}, headers: headers }
    it 'returns measurements' do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end
  end
  describe 'POST /api/user-measurement' do
    let(:valid_attributes) do
      #       # send json payload
      { pages_read: 10, user_id: user.id,
        book_id: book.id,date: Date.today.to_s }.to_json
    end
    context 'when request is valid' do
      before { post '/api/user-measurement', params: valid_attributes, headers: headers }
      it 'creates a measurement' do
        expect(json['pages_read']).to eq(10)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when the request is invalid' do
      let(:invalid_attributes) { { pages_read: nil }.to_json }
      before { post '/api/user-measurement', params: invalid_attributes, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Book must exist, Pages read can't be blank/)
      end
    end
  end
end
