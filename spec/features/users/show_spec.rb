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
    let!(:user_viewing_parties) { create_list(:user_viewing_party, 20) }
    let(:user) { users.first }

    it 'Shows the user name' do
      visit user_path(user)

      expect(page).to have_content(user.name)
    end

    it 'it has a button to discover movies' do
      visit user_path(user)

      expect(page).to have_button('Discover Movies')
    end

    it 'has a list of hosted parties' do
      visit user_path(user)

      within '#hosted_parties' do
        user.viewing_parties.each do |party|
          user_party = user.user_viewing_parties.find_by(viewing_party_id: party.id)
          if user_party.hosting
            within "#viewing_party_#{party.id}" do
              expect(page).to have_content(party.movie.title)
              expect(page.find('img')[:src]).to eq("https://image.tmdb.org/t/p/w200/#{party.movie.image}")
              expect(page).to have_content(party.date.strftime('%-m/%-d/%Y'))
              expect(page).to have_content(party.start_time.strftime('%-l:%M %p'))
              expect(page).to have_content('You are the Host')
              party.users.each do |invitee|
                expect(page).to have_content(invitee.name) unless invitee == user
              end
            end
          else
            expect(page).to_not have_css("#viewing_party_#{party.id}")
          end
        end
      end
    end

    it 'has a list of invited parties' do
      user = users.second
      visit user_path(user)

      within '#invited_parties' do
        user.viewing_parties.each do |party|
          user_party = user.user_viewing_parties.find_by(viewing_party_id: party.id)
          unless user_party.hosting
            within "#viewing_party_#{party.id}" do
              expect(page).to have_content(party.movie.title)
              expect(page).to have_content(party.date.strftime('%-m/%-d/%Y'))
              expect(page).to have_content(party.start_time.strftime('%-l:%M %p'))
              party.user_viewing_parties.each do |invitee|
                expect(page).to have_content(invitee.user.name)
                expect(page).to have_content("Host:\n#{invitee.user.name}") if invitee.hosting
              end
            end
          else
            expect(page).to_not have_css("#viewing_party_#{party.id}")
          end
        end
      end
    end
  end
end