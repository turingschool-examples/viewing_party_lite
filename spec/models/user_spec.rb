require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'instance methods' do
      it "see if a email is unquie" do
        user = User.create!(name: "bob", email: "bob@gmail.com")
        user2 = User.create!(name: "tom", email: "tom@gmail.com")

        expect(User.all_emails).to eq(["bob@gmail.com", "tom@gmail.com" ])
    end
  end
end
