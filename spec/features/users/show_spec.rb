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
    @user_4 = User.create!(name: "Mat", email: "mat@example.com")
    @movie = MovieFacade.all_movie_info(550)

    @vp = @user_1.viewing_parties.create!(movie_id: 550, duration: 139, start_day: Date.today, start_time: Time.now)

    UserViewingParty.create!(user_id: @user_2.id, viewing_party_id: @vp.id, status: 'Invited')
    UserViewingParty.create!(user_id: @user_3.id, viewing_party_id: @vp.id, status: 'Invited')
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

  describe 'section for parties invited to' do
    it 'lists the party attributes' do
      visit user_path(@user_2)

      within "div#invited_parties" do
        expect(page).to have_link(@movie.title, href: user_movie_path(@user_2, @movie.id))
        expect(page).to have_xpath("//img[@src = 'https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg']")
        expect(page).to have_content(@vp.start_day.strftime("%A, %B %-d, %Y"))
        expect(page).to have_content(@vp.start_time.strftime('%l:%M %p'))
      end
    end

    it 'lists the host and invitees' do
      visit user_path(@user_2)

      within "div#invited_parties" do
        expect(page).to have_content("Host: #{@user_1.name}")
        expect(page).to have_css('b', text: @user_2.name)
        expect(page).to_not have_css('b', text: @user_3.name)
        expect(page).to have_content(@user_3.name)
        expect(page).to_not have_content(@user_4.name)
      end
    end
  end

  describe 'section for hosted parties' do
    it 'lists the party attributes' do
      visit (user_path(@user_1))

      within("div#hosted_parties") do
        expect(page).to have_link(@movie.title, href: user_movie_path(@user_1, @movie.id))
        expect(page).to have_xpath("//img[@src = 'https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg']")
        expect(page).to have_content(@vp.start_day.strftime("%A, %B %-d, %Y"))
        expect(page).to have_content(@vp.start_time.strftime('%l:%M %p'))
      end
    end

    it 'lists all the invitees' do
      visit (user_path(@user_1))

      within("div#hosted_parties") do
        expect(page).to_not have_content(@user_1.name)
        expect(page).to have_content(@user_2.name)
        expect(page).to have_content(@user_3.name)
        expect(page).to_not have_content(@user_4.name)
      end
    end
  end
end