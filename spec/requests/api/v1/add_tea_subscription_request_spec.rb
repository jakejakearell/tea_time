require 'rails_helper'

RSpec.describe 'Create a pet request' do
  describe 'happy path' do
    before :each do
      @user = create(:user)
      @subscription = create(:subscription)
    end

    it "can add a subscription to an existing user" do
      subscription_info = {
                            user_id: @user.id,
                            subscription_id: @subscription.id
                          }

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/subscription', headers: headers, params: subscription_info.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")

      subscription_json = JSON.parse(response.body, symbolize_names: true)

      expect(subscription_json).to be_a(Hash)
      expect(subscription_json[:data]).to be_a(Hash)
      expect(subscription_json[:data].keys).to eq([:id, :type, :attributes])
      expect(subscription_json[:data][:id]).to be_a(String)
      expect(subscription_json[:data][:type]).to eq('user_subscription')
      expect(subscription_json[:data][:attributes].count).to eq(3)
      expect(subscription_json[:data][:attributes].keys).to eq([:user_id, :subscription_id, :active])
      expect(subscription_json[:data][:attributes][:active]).to eq(true)
      expect(subscription_json[:data][:attributes][:user_id]).to eq(@user.id)
      expect(subscription_json[:data][:attributes][:subscription_id]).to eq(@subscription.id)
    end
  end
end
