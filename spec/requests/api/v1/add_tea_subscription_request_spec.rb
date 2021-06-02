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
                            subscription_id: @subscription.id,
                            active: true
                          }

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/subscription', headers: headers, params: subscription_info.to_json

    end
  end
end
