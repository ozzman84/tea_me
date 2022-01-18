require 'rails_helper'

RSpec.describe "Api::V1::Customers::Subscriptions", type: :request do
  describe 'customer subscriptions API' do
    let!(:customer) { create_list(:customer, 2) }
    let!(:subscriptions) { create(:subscription, customer_id: customer.first.id) }
    let!(:active_subs) { create_list(:subscription, 5, customer_id: customer.last.id) }
    let!(:cancelled_subs) { create_list(:subscription, 5, customer_id: customer.last.id) }

    describe 'get customer subscriptions' do
      before { get api_v1_customers_subscriptions_path(customer_id: customer.last.id) }

      it 'returns subscriptions' do
        expect(json).not_to be_empty
        expect(json[:data].size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'Create Subscription' do
      let(:valid_params) {
        {
          title: Faker::Tea.variety,
          price: Faker::Number.decimal(l_digits: 2),
          customer_id: customer.first.id
        }
      }
      before { post api_v1_customers_subscriptions_path, params: valid_params }

      context 'With valid params' do
        it 'returns successful reponse code 201' do
          expect(response).to have_http_status(201)
        end

        it 'creates subscription' do
          expect(json).not_to be_empty
          expect(json[:data][:attributes][:title]).to eq(valid_params[:title])
        end
      end

      context 'when record does not exist' do
        let(:invalid_params) {
          {
            title: Faker::Tea.variety,
            price: Faker::Number.decimal(l_digits: 2),
            customer_id: customer.last.id + 1
          }
        }
        before { post api_v1_customers_subscriptions_path, params: invalid_params }

        it 'returns reponse code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns not found message' do
          expect(response.body).to match(/Couldn't find Customer/)
        end
      end
    end

    describe 'Update Subscription' do
      let(:new_attributes) { { title: Faker::Tea.variety } }
      before { patch api_v1_customers_subscription_path(subscriptions.id), params: new_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
