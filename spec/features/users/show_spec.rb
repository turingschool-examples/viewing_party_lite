require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe "when I visit '/users/:id' where :id is a valid user, I should see" do
    it "has '<user's name>'s Dashboard' at the top of the page" do
      @user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
      @user2 = User.create!(name: 'Mike', email: 'mike@turing.edu')
      @user3 = User.create!(name: 'Meg', email: 'mstang@turing.edu')
      
      visit user_path(@user1)

      expect(page).to have_content("Erin's Dashboard")
      expect(page).to_not have_content("Mike's Dashboard")
      expect(page).to_not have_content("Meg's Dashboard")
    end

    it 'has a button to Discover Movies' do
      @user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
      visit user_path(@user1)

      expect(page).to have_button('Discover Movies')
    end

    it 'has a section that lists viewing parties' do
      @user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')
      visit user_path(@user1)

      expect(page).to have_css('#viewing_parties')
    end
  end
end
