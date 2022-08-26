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

  xit "is able to tell the information for the viewing party" do
    expect(page).to have_content("Viewing party Details")
    expect(page).to have_content("Duration of Party")
    expect(page).to have_content("Day")
    expect(page).to have_content("Start Time")
  end

  xit "it is able to create a new viewing party" do
    expect(page).to have_content("Viewing party Details")

    fill_in('Day', with: '06/29/2022')
    fill_in('Start Time', with: '7:00')

    click_button "Create Party"

    expect(current_path).to eq("/users/#{@user1.id}")
  end

end
