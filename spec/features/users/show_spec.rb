# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user show page' do
  before(:each) do
    ViewingPartyUser.delete_all
    ViewingParty.delete_all
    User.delete_all

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    json_response_2 = File.read('spec/fixtures/shawshank.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response_2, headers: {})

    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))
    @movie_detail_2 = MovieDetail.new(JSON.parse(json_response_2, symbolize_names: true))
    @viewing_party_1 = ViewingParty.create!(duration: '180', host_id: @user_1.id, movie_id: @movie_detail.id,
                                            party_date: Date.today, party_time: '17:00')
    @viewing_party_2 = ViewingParty.create!(duration: '200', host_id: @user_2.id, movie_id: @movie_detail_2.id,
                                            party_date: Date.today - 1, party_time: '18:00')
    @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
    @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)
    @viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)

    visit login_path
    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password
    click_button("Log In")
  end

  it 'displays the site and page title' do
    visit "/dashboard"

    expect(page).to have_content('Viewing Party')
    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end

  it 'has a button to link to the discover movies page' do
    visit "/dashboard"

    within '#discover_link' do
      expect(page).to have_button 'Discover Movies'
      expect(page).to_not have_content('My Viewing Parties')
      click_button 'Discover Movies'
    end
    expect(current_path).to eq("/discover")
  end

  it 'has a section for viewing parties' do
    visit "/dashboard"

    within('#viewing_parties') do
      expect(page).to have_content('My Viewing Parties')
      expect(page).to_not have_content('Discover Movies')
    end
  end

  it 'displays the movie image and title(as a link) in the viewing parties section' do
    visit "/dashboard"

    within('#viewing_parties') do
      expect(page).to have_link(@movie_detail.title.to_s)
    end
  end

  it 'displays the viewing party information' do
    visit "/dashboard"
    within('#viewing_parties') do
      expect(page).to have_content(@viewing_party_1.duration)
      expect(page).to have_content(@viewing_party_1.party_time.strftime('%I:%M%p'))
      expect(page).to have_content(@viewing_party_1.party_date.strftime('%B %d, %Y'))
    end
  end

  it 'displays the attendees' do
    visit "/dashboard"
    within("#attendees-#{@viewing_party_1.movie_id}") do
      expect(page).to have_content("#{@user_2.name}")
      expect(page).to have_content("#{@user_1.name}")
      expect(page).to_not have_content("#{@user_3.name}")
    end
  end
end
