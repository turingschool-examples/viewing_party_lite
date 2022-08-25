require 'rails_helper'

RSpec.describe 'top rated movies page' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com')

    visit "/users/#{@user1.id}/movies/top_rated"
  end


  it 'lists top rated mopvies and their vote average', :vcr do
    # save_and_open_page
      expect(page).to have_content("Title: The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
  end

end
