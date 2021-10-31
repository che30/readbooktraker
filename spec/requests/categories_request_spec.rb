require 'rails_helper'

RSpec.describe 'categories API', type: :request do
  # initialize test data
  let!(:categories) { create_list(:categorie , 10) }
  # let(:categorie_id) { categorie.first.id }

  # Test suite for GET /categories
  describe 'GET /categories' do
    # make HTTP get request before each example
    before { get '/categories'  }

    it 'returns categories' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # # Test suite for POST /categories
  # describe 'POST /categories' do
  #   # valid payload
  #   let(:valid_attributes) { { name: 'Fiction' } }

  #   context 'when the request is valid' do
  #     before { post '/categories', params: valid_attributes }

  #     it 'creates a categorie' do
  #       expect(json['name']).to eq('Fiction')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post '/categories', params: { title: '' } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Created by can't be blank/)
  #     end
  #   end
  # end
end