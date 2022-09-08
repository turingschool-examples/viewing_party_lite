require 'rails_helper'

RSpec.describe 'top rated movies page' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com')

    visit "/users/#{@user1.id}/discover"
    click_button 'Top Rated Movies'
  end


  it 'lists top rated mopvies and their vote average', :vcr do
      expect(page.status_code).to eq 200
      expect(page).to have_content("Title: The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
  end

end
