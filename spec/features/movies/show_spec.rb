require 'rails_helper'

RSpec.describe 'movie details page' do
	let!(:user) {User.create!(name:'person', email: 'email@email.com')}
	it 'lists movie details' do 

    details = JSON.parse(File.read('spec/fixtures/movie_details.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_details).and_return(details)
    cast = JSON.parse(File.read('spec/fixtures/movie_cast.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_cast).and_return(cast)
    review = JSON.parse(File.read('spec/fixtures/movie_review.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_review).and_return(review)
    
    visit "users/#{user.id}/movies/545611"

    save_and_open_page

	end
end
