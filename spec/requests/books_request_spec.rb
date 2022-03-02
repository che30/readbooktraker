require 'rails_helper'
require 'faker'
RSpec.describe 'Books', type: :request do
  let(:user) { create(:user) }
  let(:cat) { Category.create!(name: 'science fiction') }
  let!(:books) do
    Book.create!(name: 'first book',
                 author: Faker::Name.name, isbn: Faker::Lorem.characters(number: 4),
                 number_of_pages: Faker::Number.number(digits: 3),
                 category_id: cat.id,
                 user_id: user.id)
  end
  let(:headers) { valid_headers }
  describe 'GET /api/users/1/books' do
    before { get "/api/users/#{user.id}/books", params: {}, headers: headers }
    it 'returns books' do
      expect(json).not_to be_empty
    end
  end
  describe 'POST /api/users/:user_id/books' do
    let(:valid_attributes) do
      #       # send json payload
      { name: 'crown of thorns', user_id: user.id,
        category_id: cat.id, author: 'che nsoh',
        number_of_pages: 200,
        isbn: Faker::Name.unique.name }.to_json
    end
    context 'when request is valid' do
      before { post '/api/users/1/books', params: valid_attributes, headers: headers }
      it 'creates a books' do
        expect(json['name']).to eq('crown of thorns')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    # context 'when the request is invalid' do
    #   let(:invalid_attributes) { { pages_read: nil }.to_json }
    #   before { post '/api/user-measurement', params: invalid_attributes, headers: headers }
    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end
    #   it 'returns a validation failure message' do
    #     expect(json['message'])
    #       .to match(/Validation failed: Book must exist, Pages read can't be blank/)
    #   end
    # end
  end
end
