require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @user = User.create!(name: "John", email: "john@example.com")
  end

  it 'lists the cast' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/cast_response.json', headers: {}))
    WebMock.disable!
    visit user_movie_path(@user, 550)

    expect(page).to have_content("Fight Club")
  end
end