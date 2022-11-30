require 'rails_helper'

RSpec.describe 'The User show page' do
  describe 'As an admin' do
    describe 'When I visit the Landing page' do
      before(:each) do
        @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com')
        @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com')
        @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com')
      end

      it 'shows the users name at the top of the page' do
        visit user_path(@user_1)

        expect(page).to have_content("Mary's Dashboard")
        expect(page).not_to have_content("Sherri's Dashboard")
        expect(page).not_to have_content("Larry's Dashboard")

        visit user_path(@user_1)

        expect(page).to have_content("Larry's Dashboard")
        expect(page).not_to have_content("Mary's Dashboard")
        expect(page).not_to have_content("Sherri's Dashboard")

        visit user_path(@user_2)

        expect(page).to have_content("Sherri's Dashboard")
        expect(page).not_to have_content("Larry's Dashboard")
        expect(page).not_to have_content("Mary's Dashboard")
      end
    end
  end
end
