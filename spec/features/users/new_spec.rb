require 'rails_helper'

RSpec.describe 'The User registration' do
  describe 'As a User' do
    describe 'When I visit the User Registration Page' do
      before(:each) do
        @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com')
        @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com')
        @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com')
      end
      it 'I see a link to create a new user'
        visit root_path
        click_button('New User')
        expect(current_path).to eq(register_path)

        fill_in 'Name', with: 'Martin'
        fill_in 'Email', with: 'martin@gmail.com'
        click_on 'Create Account'

        expect(page).to eq(user_path)
      end
    end
  end
end
