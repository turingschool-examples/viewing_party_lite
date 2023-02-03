require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['api_key']}&language=en-US").      
      to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/reviews_response.json'), headers: {})
    @user_1 = User.create!(name: "John", email: "john@example.com")
    @user_2 = User.create!(name: "Bill", email: "nom@example.com")
    @user_3 = User.create!(name: "Bob", email: "nin@example.com")
    @movie = MovieFacade.all_movie_info(550)

    @vp = @user_1.viewing_parties.create!(movie_id: 550, duration: 139, start_day: Date.today, start_time: Time.now)

    UserViewingParty.create!(user_id: @user_2.id, viewing_party_id: @vp.id, hosting: 'Invited')
    UserViewingParty.create!(user_id: @user_3.id, viewing_party_id: @vp.id, hosting: 'Invited')

  end

  it 'Displays the name of the user' do
    visit user_path(@user_1)

    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end

  it 'Has button to Discover Movies page' do
    visit user_path(@user_1)

    expect(page).to have_button('Discover Movies')
    
    click_button 'Discover Movies'
    
    expect(current_path).to eq(user_discover_index_path(@user_1))
  end

  it 'Has a section for viewing parties, hosted and invited to' do
    visit user_path(@user_1)

    within "div#invited_parties" do
      # expect(page).to have_content()
    end
  end
end