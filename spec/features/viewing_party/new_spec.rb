require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before(:each) do
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/movie_details_godfather238.json'), headers: {})

      @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
      @user2 = User.create!(name: 'John Smith', email: 'johndoe@gmail.com')
      @user3 = User.create!(name: 'John Williams', email: 'johndoe@email.com')
      @user4 = User.create!(name: 'John Kennedy', email: 'johndoe@webmail.com')
      @user5 = User.create!(name: 'John Deere', email: 'johndoe@mail.com')
      @movie = MovieFacade.movie_details(238)
  end

  it 'displays the movie title for the new viewing party' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)

    expect(page).to have_content("Create a Movie Party for The Godfather")
  end
  
  it 'has a link back to the discover page' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)

    expect(page).to have_link('Discover Page', href: user_discover_index_path(@user1))
  end

  it 'has a form to enter details for user party and duration defaults to movies runtime' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)
    users = [@user2, @user3, @user4, @user5]

    within '#party-details' do
      expect(page).to have_content("The Godfather")
      expect(page).to have_field('Duration of Party', with: @movie.runtime)
      expect(page).to have_field('Day')
      expect(page).to have_field('Start Time')
      expect(page).to have_button('Create Party')
      users.each do |user|
        expect(page).to have_content(user.name)
        expect(page).to have_content(user.email)
      end
      expect(page).to_not have_content(@user1.name)
    end
  end

  it 'creates a new viewing party and viewing party users when you complete form with valid data' do
    visit new_user_movie_viewing_party_path(@user1, @movie.id)
    
    fill_in 'Duration of Party', with: '200'
    fill_in 'Day', with: '%03.%02.%2023'
    fill_in 'Start Time', with: '08:00 PM'
    
    check("#{@user2.name}")
    check("#{@user3.name}")
    click_button 'Create Party'

    expect(current_path).to eq(user_path(@user1))
    within "#viewing_party#{ViewingParty.maximum(:id)}" do
      expect(page).to have_content('February 03, 2023')
      expect(page).to have_content('Hosting John Smith John Williams')
      expect(page).to have_content('8:00 pm')
      expect(page).to have_content(@movie.title)
    end

    visit user_path(@user2)
    
    within "#viewing_party#{ViewingParty.maximum(:id)}" do
      expect(page).to have_content('February 03, 2023')
      expect(page).to have_content('Invited')
      expect(page).to have_content('8:00 pm')
      expect(page).to have_content(@movie.title)
      expect(page).to have_content('John Doe John Smith John Williams')
    end
  end

  it 'does not create a viewing party if you enter invalid data' do
    visit new_user_movie_viewing_party_path(@user2, @movie.id)

    fill_in 'Duration of Party', with: '200'
    fill_in 'Day', with: '%03.%02.%2023'
    check("#{@user1.name}")
    check("#{@user3.name}")
    click_button 'Create Party'

    expect(current_path).to eq(new_user_movie_viewing_party_path(@user2, @movie.id))
    expect(page).to have_content("Start time can't be blank")
  end
end
