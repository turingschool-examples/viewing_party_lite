require 'rails_helper'

RSpec.describe 'The new viewing party page' do

    before :each do 
      UserParty.destroy_all
      User.destroy_all
      Party.destroy_all
      visit register_path
      fill_in 'Name', with: 'Plain Name'
      fill_in 'Email', with: 'User@gmail.com'
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
  
      click_button('Register')
      @user_1 = User.last

      visit register_path
      fill_in 'Name', with: 'Jane Name'
      fill_in 'Email', with: 'User2@gmail.com'
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
  
      click_button('Register')
      @user_2 = User.last

      visit register_path
      fill_in 'Name', with: 'Cain Name'
      fill_in 'Email', with: 'User3@gmail.com'
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '1234'
  
      click_button('Register')
      @user_3 = User.last
    end 

  it "exists and has a movie title" do

    VCR.use_cassette('new_party_movie_1') do
      visit "/movies/24126/viewing_party/new"
      expect(current_path).to eq("/movies/24126/viewing_party/new")

      within '#title' do
        expect(page).to have_content("Warlock: The Armageddon")
      end
    end
  end

  it "has a form a user can fill out to make a viewing party" do

    VCR.use_cassette('new_party_movie_2') do
      visit "/movies/24126/viewing_party/new"

      within '#form' do
        check "#{@user_1.name}"
        check "#{@user_3.name}"
        click_button('Create')
      end
    end
    expect(current_path).to eq("/dashboard")
  end
end
