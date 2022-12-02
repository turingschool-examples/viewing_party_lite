require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")
    visit(user_path(@user1.id))
  end

  describe 'when I visit users/:id' do
    it 'I see the user names dashboard header at top of page' do

      expect(page).to have_content("#{@user1.name}s Dashboard")
      expect(page).to_not have_content("#{@user2.name}s Dashboard")
    end

    it 'I see a button to discover movies' do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"

      expect(current_path).to eq(user_discover_index_path(@user1.id))
    end

    it 'has a section that lists viewing parties' do
      expect(page).to have_content("#{@user1.name}s Viewing Parties")
      # save_and_open_page
    end

    it 'in viewing parties, I should see the movie image' do 
      # expect(page).to have_content(#image)
    end

    it 'displays movie title that links to the movie show page' do 
      expect(page).to have_link("The Shawshank Redemption")
    end
  end
end
