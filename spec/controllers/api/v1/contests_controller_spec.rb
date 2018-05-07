require 'rails_helper'

RSpec.describe Api::V1::ContestsController, type: :controller do

  let(:contest_keys) {[
    :id, :status, :contest_type, :winner_id,
    :finished_at, :created_at, :contest_pets
  ]}

  let(:contest_pets_keys) {[:id, :contest_id, :pet_uid]}

  describe '/api/v1/contests' do
    context 'GET' do

      before(:each) do
        create_list(:contest_with_contest_pets, 2)
        get :index
      end

      it 'returns an ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'it has a content type of application/json' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns an array of contests' do
        expect(json.is_a?(Array)).to eq true
      end

      it 'returns 2 contests' do
        expect(json.length).to eq 2
      end

      it 'has contests keys' do
        expect(json[0].keys).to eq contest_keys
      end
    end
  end

  describe '/api/v1/contests/:id' do
    context 'GET' do

      let(:contest) {create(:contest_with_contest_pets)}

      before(:each) do
        get :show, params: { id: contest.id }
      end

      it 'returns an ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'has a content type of application/json' do
        expect(response.content_type).to eq('application/json')
      end

      it 'has contests keys' do
        expect(json.keys).to eq contest_keys
      end

      it 'has a nested set of contest_pets keys' do
        expect(json[:contest_pets][0].keys).to eq contest_pets_keys
      end

      it 'has a 2 nested sets of contest_pets' do
        expect(json[:contest_pets].length).to eq 2
      end
    end
  end

  describe '/api/v1/contests' do
    context 'POST' do

      before(:each) do
        post :create, params: build(:contest_post_request)
      end

      it 'returns an 201 created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'has a content type of application/json' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns a contest id' do
        expect(json.keys).to eq [:id]
      end
    end
  end
end
