require 'rails_helper'

RSpec.describe 'Movies Detail (show) page' do
  before :each do
    @user = create(:user)
    @godfather_genres = [{id: 18,
              name: 'Drama'
              },
              {id: 80,
              name: 'Crime'
              }
              ]
    @godfather_hash = {id: 238,
                      title: 'The Godfather',
                      vote_average: 8.715,
                      runtime: 175,
                      genres: @godfather_genres,
                      overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge."
                    }
    VCR.use_cassette('movie_credits') do 
      VCR.use_cassette('movie_reviews') do
        @godfather = MovieHeavy.new(@godfather_hash)
      end
    end

    VCR.use_cassette('movie_details') do
      VCR.use_cassette('movie_credits') do 
        VCR.use_cassette('movie_reviews') do
          visit "/users/#{@user.id}/movies/#{@godfather.id}"
        end
      end
    end
  end
  
  describe 'as a user' do
    it 'I see a button to create a viewing party' do
      expect(page).to have_button("Create Viewing Party for #{@godfather.movie_title}")
      
      VCR.use_cassette('movie_details') do
        VCR.use_cassette('movie_credits') do 
          VCR.use_cassette('movie_reviews') do
            click_button ("Create Viewing Party for #{@godfather.movie_title}")
          end
        end
      end

      expect(current_path).to eq(new_user_movie_viewing_party_path(@user.id, @godfather.id))
    end
    
    it 'I see a button to return to the discover page' do
      expect(page).to have_button('Discover')
      click_button ('Discover')
      
      expect(current_path).to eq(user_discover_index_path(@user.id))
    end

    it 'I see the details related to the movie' do
      expect(page).to have_content(@godfather.movie_title)
      expect(page).to have_content(@godfather.vote_average)
      expect(page).to have_content(@godfather.runtime)

      within("#genre") do
      expect(page).to have_content(@godfather.genres.first[:name])
      expect(page).to have_content(@godfather.genres.last[:name])
      end

      expect(page).to have_content(@godfather.summary)
      within("#cast") do
        expect(page).to have_content(@godfather.first_10_cast_members.first[:name])
        expect(page).to have_content(@godfather.first_10_cast_members.first[:character])
        expect(page).to have_content(@godfather.first_10_cast_members[9][:name])
        expect(page).to have_content(@godfather.first_10_cast_members[9][:character])
      end
      within("#reviews") do
        expect(page).to have_content(@godfather.reviews[:results].first[:author])
        expect(page).to have_content(@godfather.reviews[:results].first[:content].gsub(/\n/, ' '))
        expect(page).to have_content(@godfather.reviews[:results].last[:author])
        expect(page).to have_content(@godfather.reviews[:results].last[:content].gsub(/\n/, ' '))
        expect(page).to have_content("Review Count: #{@godfather.reviews[:results].size}")
      end
    end
  end
end