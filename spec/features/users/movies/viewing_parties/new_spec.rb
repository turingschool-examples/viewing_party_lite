require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com", password: 'pw123', password_confirmation: 'pw123')

    details_response = File.read('spec/fixtures/shawshank_details.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: details_response)

    credits_response = File.read('spec/fixtures/shawshank_credits.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278/credits?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: credits_response)

    reviews_response = File.read('spec/fixtures/shawshank_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278/reviews?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: reviews_response)

    visit(new_user_movie_viewing_party_path(@user1.id, 278))
  end

  it 'should display movie title' do
    expect(page).to have_content("The Shawshank Redemption")
  end
  it 'should have a form with duration of party, duration must be at least equal to movie runtime' do
    expect(page).to have_field(:duration)
  end
  it 'should have fields to select date and time' do
    expect(page).to have_field(:date)
    expect(page).to have_field(:time)
  end
  it 'should have checkboxes next to each existing user in the system' do
    within "#Ashley" do
      expect(page).to have_field("users[]", checked: false)
    end
    within "#William" do
      expect(page).to have_field("users[]", checked: false)
    end
    within "#Abdul" do
      expect(page).to have_field("users[]", checked: false)
    end
  end
  it 'should have a button to create the party, that if successful, redirects back to user dashboard' do
    expect(page).to have_button("Create Party")
    fill_in :duration, with: 200
    fill_in :date, with: "2023/04/22"
    fill_in :time, with: "05:00 PM"
    within "#Ashley" do
      check "users[]"
    end
    within "#William" do
      check 'users[]'
    end
    click_button "Create Party"
    expect(current_path).to eq(user_path(@user1.id))
  end
end
