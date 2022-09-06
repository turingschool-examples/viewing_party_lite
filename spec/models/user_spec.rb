require 'rails_helper'

RSpec.describe User, type: :model do
    describe "validations" do
        it {should validate_presence_of(:password)}
        it {should have_secure_password}
    end
    it " has the right attributes" do
        user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
        expect(user).to_not have_attribute(:password)
        expect(user.password_digest).to_not eq('password1')
    end
end
