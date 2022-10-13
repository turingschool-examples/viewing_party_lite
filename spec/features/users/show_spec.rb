require 'rails_helper'

RSpec.describe "User Dashboard Page", type: :feature do
  before :each do
    @user_1 = create(:user)
    visit user_path(@user_1.id)
  end

  it 'shows name of user on page' do
    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")
    expect(current_path).to eq(user_discover_path(@user_1.id))
  end

  context 'viewing parties' do

    before :each do
      @vp_1 = create(:viewing_party, host: @user_1, movie_id: 286)
      @vp_2 = create(:viewing_party, movie_id: 36685)
      @vp_3 = create(:viewing_party, movie_id: 17473)
      @vp_2.users << @user_1
      @vp_3.users << @user_1

      visit user_path(@user_1.id)
    end

    it 'has a section which shows user viewing parties', :vcr do

      within("#vp_#{@vp_1.id}") do
        expect(page).to have_content("Host: You!")
        expect(page).to have_link(@vp_1.movie.title)
        expect(page.find("#movie_img_#{@vp_1.movie_id}")['src']).to have_content(@vp_1.movie.image_path)
        expect(page).to have_content(@vp_1.date.strftime("%B %-d, %Y"))
        expect(page).to have_content(@vp_1.start_time.strftime("%l:%M %P"))
      end

      within("#vp_#{@vp_2.id}") do
        expect(page).to have_content("Host: #{@vp_2.host.name}")
        expect(page).to have_content("Invitees:\n#{@user_1.name}")
        expect(page).to have_link(@vp_2.movie.title)
        expect(page.find("#movie_img_#{@vp_2.movie_id}")['src']).to have_content(@vp_2.movie.image_path)
        expect(page).to have_content(@vp_2.date.strftime("%B %-d, %Y"))
        expect(page).to have_content(@vp_2.start_time.strftime("%l:%M %P"))
      end
        
      within("#vp_#{@vp_3.id}") do
        expect(page).to have_content("Host: #{@vp_3.host.name}")
        expect(page).to have_content("Invitees:\n#{@user_1.name}")
        expect(page.find("#movie_img_#{@vp_3.movie_id}")['src']).to have_content(@vp_3.movie.image_path)
        expect(page).to have_content(@vp_3.date.strftime("%B %-d, %Y"))
        expect(page).to have_content(@vp_3.start_time.strftime("%l:%M %P"))
        expect(page).to have_link(@vp_3.movie.title)
      end
    end

    it 'movie titles link to user movie show page', :vcr do
      within("#vp_#{@vp_1.id}") do
        click_link(@vp_1.movie.title)
        expect(current_path).to eq(user_movie_path(@user_1.id, @vp_1.movie_id))
      end
    end

  end
end