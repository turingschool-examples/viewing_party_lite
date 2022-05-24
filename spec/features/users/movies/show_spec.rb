require 'rails_helper'

RSpec.describe 'the movie detail page' do
  before :each do
    @user = User.create(name: "Sandisz Thieme", email: "absolutegigachad420@hotmail.com", password: 'password123', password_confirmation: 'password123')
    # @movie = Movie.create(title: "The Shawshank Redemption", vote_average: "8.7", id: "18")
  end

  it 'has a button to create a viewing party that links to the new viewing party page' do
    VCR.use_cassette("has_a_button_to_create_a_viewing_party_that_links_to_the_new_viewing_party_page") do
        # visit "/users/#{@user.id}/movies/278"
        visit user_movie_path(@user, 278)

        expect(page).to have_button("Create Viewing Party")
        # click_button "Create Viewing Party"
        # expect(current_path).to eq("/users/#{@user.id}/movies/278/parties/new")
    end
  end
end
