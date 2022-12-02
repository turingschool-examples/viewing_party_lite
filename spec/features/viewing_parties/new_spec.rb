require 'rails_helper'

RSpec.describe 'New Viewing Party Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  it 'should contain title of Viewing Party and a Home link that will redirect the user
    the landing page' do
    visit root_path
    within('#dashboard') do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq(root_path)
    end
  end

  it 'should have the name of the movie title above a form' do
    visit new_user_movie_viewing_party_path(@user1.id, 238)

    expect(page).to have_content('The Godfather')
    # expect(@movie.title).to appear_before(form) #unsure if this is how this should be set up, to check if title appears before form
  end

  it "should have a form with the following fields: party_duration, date, start_time, check boxes
    next to each user in the system, a button to create party and details about the movie" do
    visit new_user_movie_viewing_party_path(@user1.id, 238)

    expect(page).to have_field(:duration)
    expect(page).to have_field(:date)
    expect(page).to have_button('Create Party')

    expect(page).to have_content(@movie.details)

    # may want to look at enum for host, change value to int and boolean as part of enum
    within("#users_#{@user1.id}") do
      expect(page).to have_field(:collection_check_boxes)
      expect(page).to have_content(@user1.name)
    end

    within("#users_#{@user2.id}") do
      expect(page).to have_field(:collection_check_boxes)
      expect(page).to have_content(@user2.name)
    end

    within("#users_#{@user3.id}") do
      expect(page).to have_field(:collection_check_boxes)
      expect(page).to have_content(@user3.name)
    end
  end

  xit "the party_duration field should be pre-filled out with default value of movie run time in
    minutes" do
    visit new_user_movie_viewing_party_path(@user1.id, @movie.id)

    expect(page).to have_field(:duration, with: @movie_minutes)
    # will want to make a method to change hours minutes to minutes
  end

  xit "should not create a viewing party if the run time is changed to a number less than the default
    run time of the movie" do
      visit new_user_movie_viewing_party_path(@user1.id, @movie.id)

      fill_in :party_duration,	with: 4
      click_button 'Create Party'

      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1.id, @movie.id))
      expect(page).to have_content('whatever the invalid viewing party error is') # will need to update based on what the error is
    end
end
