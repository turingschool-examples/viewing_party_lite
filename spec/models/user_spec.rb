require 'rails_helper'

RSpec.describe User, type: :model do
    describe "validations" do
        it { should validate_presence_of(:name) }
        it { should validate_uniqueness_of(:email) }
        it { should have_secure_password }
    end

    describe "relationships" do
        it { should have_many :party_users }
        it { should have_many(:parties).through(:party_users) }
    end

    describe "check password security" do
        it "has a secure password" do
            user = User.create!(name: 'honey', email: 'honey2@gmail.com', password: 'test123', password_confirmation: 'test123')
            expect(user).to_not have_attribute(:password)  
            expect(user).to_not have_attribute(:password_confirmation)
            expect(user.password_digest).to_not eq('test123')        
        end
    end
    

end