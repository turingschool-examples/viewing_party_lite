require 'rails_helper'

RSpec.describe 'Viewing Party New' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  before :each do
    json_response = File.read('spec/fixtures/the_godfather.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response)
  end

  it 'can create a new viewing party' do
    visit new_user_movie_viewing_party_path(user, 238)
    start_time = Time.now

    expect(page).to have_field('viewing_party[duration]', with: 175 )

    fill_in('viewing_party[date]', with: Date.today)
    fill_in('viewing_party[start_time]', with: start_time)

    page.check("viewing_party[#{users.second.id}]")
    page.check("viewing_party[#{users.fourth.id}]")

    click_button('Create Viewing Party')

    expect(current_path).to eq(user_path(user))
    viewing_party = ViewingParty.first

    expect(viewing_party.date).to eq(Date.today)
    expect(viewing_party.start_time.strftime('%H:%M')).to eq(start_time.utc.strftime('%H:%M'))
    expect(viewing_party.users).to eq([users.first, users.second, users.fourth])
    user_viewing_party_1 = UserViewingParty.find_by(user_id: user.id)
    user_viewing_party_2 = UserViewingParty.find_by(user_id: users.second.id)
    expect(user_viewing_party_1.hosting).to eq(true)
    expect(user_viewing_party_2.hosting).to eq(false)
  end

  it 'displays the information on the users page' do
    visit new_user_movie_viewing_party_path(user, 238)
    start_time = Time.now

    fill_in('viewing_party[date]', with: Date.today)
    fill_in('viewing_party[start_time]', with: start_time)

    page.check("viewing_party[#{users.second.id}]")
    page.check("viewing_party[#{users.fourth.id}]")

    click_button('Create Viewing Party')

    viewing_party = ViewingParty.first

    within '#hosted_parties' do
      expect(page).to have_link("The Godfather")
      expect(page.find('img')[:src]).to eq("https://image.tmdb.org/t/p/w500/#{viewing_party.movie.image}")
      expect(page).to have_content(viewing_party.date)
      expect(page).to have_content(viewing_party.start_time.utc.strftime('%l:%M %p'))
      expect(page).to have_content("You are the Host")
      expect(page).to have_content(viewing_party.users[1].name)
      expect(page).to have_content(viewing_party.users[2].name)
    end
  end

  it 'will not create if runtime is longer than duration' do
    visit new_user_movie_viewing_party_path(user, 238)
    start_time = Time.now

    fill_in('viewing_party[duration]', with: 100 )
    fill_in('viewing_party[date]', with: Date.today)
    fill_in('viewing_party[start_time]', with: start_time)

    page.check("viewing_party[#{users.second.id}]")
    page.check("viewing_party[#{users.fourth.id}]")

    click_button('Create Viewing Party')

    expect(current_path).to eq(new_user_movie_viewing_party_path(user, 238))
    expect(page).to have_content('Duration must be greater than or equal to movie runtime')
  end

  describe 'sad paths' do
    it 'wont go to the next page if no fields are filled in' do
      visit new_user_movie_viewing_party_path(user, 238)
      start_time = Time.now


      click_button('Create Viewing Party')
      expect(page).to have_content("Date can't be blank")
      expect(page).to have_content("Start time can't be blank")
    end

    it 'wont go to the next page if no date is selected' do 
      visit new_user_movie_viewing_party_path(user, 238)
      start_time = Time.now
      
      fill_in('viewing_party[start_time]', with: start_time)
      
      click_button('Create Viewing Party')
      
      expect(page).to have_content("Date can't be blank")
      expect(page).to_not have_content("Start time can't be blank")
    end

    it 'wont go to the next page if no start time is selected' do
      visit new_user_movie_viewing_party_path(user, 238)
      start_time = Time.now

      fill_in('viewing_party[date]', with: Date.today)
      
      click_button('Create Viewing Party')
      
      expect(page).to_not have_content("Date can't be blank")
      expect(page).to have_content("Start time can't be blank")
    end
  end
end