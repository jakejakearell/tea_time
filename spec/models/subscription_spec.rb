require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of :frequency }
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
  end
end
