require 'rails_helper'

RSpec.describe 'cats API', type: :request do
  # initialize test data
  let!(:cats) { create_list(:cat, 10) }

  # Test suite for GET /cats
  describe 'GET /cats' do
    before do
      get '/cats',
          headers: 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE2NDUyNTcxNDl9.mYzSDeg6nbOswRHlXR2RKAfYqYgabReDIKpnOhnv2wo'
    end
    it 'returns cats' do
      puts json
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # # Test suite for POST /cats
  # describe 'POST /cats' do
  #   # valid payload
  #   let(:valid_attributes) { { name: 'Fiction' } }

  #   context 'when the request is valid' do
  #     before { post '/cats', params: valid_attributes }

  #     it 'creates a cat' do
  #       expect(json['name']).to eq('Fiction')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post '/cats', params: { title: '' } }

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
