require 'rails_helper'
RSpec.describe 'The movie show page' do
  it 'will show the movie attributes' do
    @lama = User.create!(name: 'Happy Lama', email: 'Happy_Lama@example.com', password: 'password123',
                         password_confirmation: 'password123')
    movie_id = 278
    @movie_details = MovieFacade.movie_details(278)
    @movie_cast = MovieFacade.movie_credit(278)[0..9]
    @movie_reviews = MovieFacade.movie_reviews(278)

    visit "/users/#{@lama.id}/movies/#{movie_id}"

    expect(page).to have_content(@movie_details.title)
    expect(page).to have_content(@movie_details.vote)
    expect(page).to have_content(@movie_details.runtime)
    expect(page).to have_content(@movie_details.all_genere_names)
    expect(page).to have_content(@movie_details.summary)
    expect(page).to have_content(@movie_cast[0].name)
    expect(page).to have_content(@movie_cast[0].character)
    expect(page).to have_content(@movie_reviews[0].author)
    expect(page).to have_content(@movie_reviews[0].content)
  end
end
