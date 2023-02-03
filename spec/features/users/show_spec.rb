require 'rails_helper'

RSpec.describe 'Users Show' do
  before :each do
    json_response_1= File.read('spec/fixtures/the_godfather.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_1)
    json_response_2 = File.read('spec/fixtures/shawshank_redemption.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_2)
    json_response_3 = File.read('spec/fixtures/puss_in_boots.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/315162?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_3)
  end
  describe 'Features' do
    let!(:users) { create_list(:user, 10) }
    let!(:viewing_parties) { create_list(:viewing_party, 3) }
    let!(:user_viewing_parties) { create_list(:user_viewing_party, 5) }
    let(:user) { users.first }

    it 'Shows the user name' do
      visit user_path(user)

      expect(page).to have_content(user.name)
    end

    it 'it has a button to discover movies' do
      visit user_path(user)

      expect(page).to have_button('Discover Movies')
    end

    it 'has a list of viewing parties' do
      visit user_path(user)

      within '#viewing_parties' do
        expect
      end
    end
  end
end