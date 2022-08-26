require 'rails_helper'

RSpec.describe 'index movies page' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com')

    visit "/users/#{@user1.id}/discover"

    click_button 'Top Rated Movies'

    click_link 'The Shawshank Redemption'

    click_button 'Create a viewing party'
  end

  it 'can see the title of the movie', :vcr do
    expect(page).to have_content("Create a Viewing Party for: The Shawshank Redemption")
  end

  it "is able to tell the information for the viewing party" do
    expect(page).to have_content("Duration of party")
    expect(page).to have_content("Date")
    expect(page).to have_content("Start time")
  end


end
