require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:email) }
  end

  before(:each) do
    @user1 = User.create!(name: "Cory", email: 'Cory@gmail.com')
    @user1 = User.create!(name: "John", email: 'John@gmail.com')
  end

  describe 'class methods' do
    it "gets all of the user's emails" do
      expect(User.all_emails).to eq(['Cory@gmail.com', 'John@gmail.com'])
    end
  end
end
