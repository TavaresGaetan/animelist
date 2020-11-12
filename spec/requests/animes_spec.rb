# spec/requests/animes_spec.rb
require 'rails_helper'

RSpec.describe 'Animes API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:animes) { create_list(:anime, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { animes.first.id }

  # Test suite for GET /users/:user_id/animes
  describe 'GET /users/:user_id/animes' do
    before { get "/users/#{user_id}/animes" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user animes' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /users/:user_id/animes/:id
  describe 'GET /users/:user_id/animes/:id' do
    before { get "/users/#{user_id}/animes/#{id}" }

    context 'when user anime exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the anime' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user anime does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Anime/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/animes
  describe 'POST /users/:user_id/animes' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/animes", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/animes", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/animes/:id
  describe 'PUT /users/:user_id/animes/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/users/#{user_id}/animes/#{id}", params: valid_attributes }

    context 'when anime exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the anime' do
        updated_anime = Anime.find(id)
        expect(updated_anime.name).to match(/Mozart/)
      end
    end

    context 'when the anime does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find nime/)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}/animes/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end