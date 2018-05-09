require 'rails_helper'

RSpec.describe Api::V1::ContestTypesController, type: :controller do

  let(:contest_types) {[:id, :desc]}

  describe '/api/v1/contest_tpes' do
    context 'GET' do
      before(:each) do
        get :index
      end
      it 'returns an ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'has a content type of application/json' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns an array of contest_types' do
        expect(json.is_a?(Array)).to eq true
      end

      it 'returns 2 contest_types' do
        expect(json.length).to eq 2
      end

      it 'has contest_type keys of id and desc' do
        expect(json[0].keys).to eq contest_types
      end
    end
  end
end
