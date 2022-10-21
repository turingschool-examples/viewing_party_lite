require 'rails_helper'

RSpec.describe 'index movies page' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com', password: "password123")

    visit "/users/#{@user1.id}/discover"
  end

  it "has a button to see top rated movies", :vcr do
    expect(page.status_code).to eq 200
    expect(page).to have_button('Top Rated Movies')
    click_button 'Top Rated Movies'

    expect(current_path).to eq("/users/#{@user1.id}/movies/index")

  end

  it 'lists top rated mopvies and their vote average', :vcr do
      click_button 'Top Rated Movies'
      expect(page.status_code).to eq 200
      expect(page).to have_content("Title: The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
  end


  it "is able to seach movies ", :vcr do
    expect(current_path).to eq "/users/#{@user1.id}/discover"

    fill_in('name', with: 'tom')

    click_button 'Search for movies'

    expect(page).to have_content("Tom & Jerry")
    expect(page).to have_content("Vote Average: 7")
  end

  it "is able to seach movies ", :vcr do
    expect(current_path).to eq "/users/#{@user1.id}/discover"

    fill_in('name', with: 'happy')

    click_button 'Search for movies'

    expect(page).to have_content("After Ever Happy")
    expect(page).to have_content("Vote Average: 6.7")
    expect(page).to_not have_content("Tom & Jerry")
  end

end
