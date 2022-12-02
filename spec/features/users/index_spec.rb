require 'rails_helper'
require 'faker'

RSpec.describe 'Users' do
  before(:each) do
    @user_1 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
    @user_2 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
    @user_3 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
    @user_4 = User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
  end

  describe 'index' do
    it 'displays all users', :vcr do
      visit "/users"
      expect(page).to have_content(@user_1.name)
    end
  end
end
