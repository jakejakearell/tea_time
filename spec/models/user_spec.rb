require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    it 'return an error if the email is not in the correct format' do
      user = User.create(
                          first_name: 'who?',
                          last_name: 'mikeeee',
                          address: 'jooooones',
                          email: "Not an email"
                        )

      expect(user.errors[:email].to_sentence).to eq("is invalid")
    end
  end
end
