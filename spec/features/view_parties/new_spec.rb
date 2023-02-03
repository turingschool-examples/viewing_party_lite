require 'rails_helper'

RSpec.describe 'new view party page' do
  before(:each) do
    ViewingPartyUser.delete_all
    ViewingParty.delete_all
    User.delete_all

    @user = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true))

    visit new_user_movie_viewing_party_path(@user.id, @movie_detail.id)
  end

  it 'displays the site title and page title at the top' do
    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("Create a Movie Party for '#{@movie_detail.title}'")
  end

  it 'has a link to return to the discover page' do
    expect(page).to have_button("Discover Page")
    click_button("Discover Page")
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  xit 'has a form to create a viewing party with the movie info already filled in' do
    within "#party_form" do
      expect(page).to have_content("Viewing Party Details")
      expect(page).to have_content("Movie Title: #{@movie_detail.title}")
      expect(page).to have_content("Duration of Party")
      expect(page).to have_field :duration, with: @movie_detail.duration
      expect(page).to have_field :date
      expect(page).to have_field :start_time
      expect(page).to have_content("Invite Other Users")
      expect(page).to have_unchecked_field("#{@user2.name} (#{@user2.email}")
      expect(page).to have_unchecked_field("#{@user3.name} (#{@user3.email}")
      expect(page).to have_unchecked_field("#{@user4.name} (#{@user4.email}")
      expect(page).to have_button("Create Party")
    end


  end

end