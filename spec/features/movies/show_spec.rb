require 'rails_helper'

RSpec.describe 'Movie show page with movie details' do

  it "can show movie details on the show page", :vcr do
    user = User.create!(name: 'Pachary Zrince', email: 'short_king@aol.com')
    movie = MovieDBFacade.movie(550)

    visit "/users/#{user.id}/movies/#{movie.id}"

    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Runtime: 139 minutes')
    expect(page).to have_content('Genre: Drama')
    expect(page).to have_content('Summary: A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.')
  end

  it "displays the first 10 cast members", :vcr do
    user = User.create!(name: 'Pachary Zrince', email: 'short_king@aol.com')
    movie = MovieDBFacade.movie(550)

    visit "/users/#{user.id}/movies/#{movie.id}"

    within "div#cast_members" do
      expect(page).to have_content('Edward Norton')
      expect(page).to have_content('Brad Pitt')
      expect(page).to have_content('Helena Bonham Carter')
      expect(page).to have_content('Meat Loaf')
      expect(page).to have_content('Jared Leto')
      expect(page).to have_content('Zach Grenier')
      expect(page).to have_content('Holt McCallany')
      expect(page).to have_content('Eion Bailey')
      expect(page).to have_content('Richmond Arquette')
      expect(page).to have_content('David Andrews')
      expect(page).to_not have_content('Christina Cabot')
    end
  end

  it "displays the review count", :vcr do
    user = User.create!(name: 'Pachary Zrince', email: 'short_king@aol.com')
    movie = MovieDBFacade.movie(550)

    visit "/users/#{user.id}/movies/#{movie.id}"

    expect(page).to have_content('Total Reviews: 7')
  end

  it "displays the author of the review", :vcr do
    user = User.create!(name: 'Pachary Zrince', email: 'short_king@aol.com')
    movie = MovieDBFacade.movie(550)

    visit "/users/#{user.id}/movies/#{movie.id}"

    within "div#reviews" do
      expect(page).to have_content('Goddard')
      expect(page).to have_content('Brett Pascoe')
      expect(page).to have_content('MSB')
      expect(page).to have_content('r96sk')
      expect(page).to have_content('rsanek')
      expect(page).to have_content('Wuchak')
      expect(page).to have_content('katch22')
    end
  end
end
