require 'rails_helper'

RSpec.describe 'New party page' do
  before(:each) do
    @user1 = User.create!(name: 'Ana', email: 'ana@example.com')
    @user2 = User.create!(name: 'Dana', email: 'dana@example.com')
    @user3 = User.create!(name: 'Manolo', email: 'manolo@example.com')
    @movie_id = 238
  end

  it 'When I visit the new party page has movie title', :vcr do
    visit new_user_movie_viewing_party_path(@user1.id, @movie_id)

    within '#title' do
      expect(page).to have_content("The Godfather")
    end
  end

  describe 'sad path' do
    it 'When I visit the new party page has a form to fill out', :vcr do
      visit new_user_movie_viewing_party_path(@user1.id, @movie_id)

      within '#form' do
        fill_in :duration, with: '5'
        select 2022, from: "_date_1i"
        select "July", from: "_date_2i"
        select 10, from: "_date_3i"
        select 14, from: "_start_time_4i"
        select 36, from: "_start_time_5i"
        check "#{@user2.name}"
        check "#{@user3.name}"
        click_button('Create')
      end

      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1.id, @movie_id))
      expect(page).to have_content("Please enter a duration that is longer than the movie runtime")
    end
  end


  describe 'happy path' do
    it 'When I visit the new party page has a form to fill out', :vcr do
      visit new_user_movie_viewing_party_path(@user1.id, @movie_id)

      within '#form' do
        fill_in :duration, with: '175'
        select 2022, from: "_date_1i"
        select "July", from: "_date_2i"
        select 10, from: "_date_3i"
        select 14, from: "_start_time_4i"
        select 36, from: "_start_time_5i"
        check "#{@user1.name}"
        check "#{@user3.name}"
        click_button('Create')
      end

      expect(current_path).to eq(user_path(@user1.id))
      within ".hostParty" do
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("2022 July 10")
      end
    end
  end
end
