require 'rails_helper'
RSpec.describe 'The movie show page' do
  before :each do
    @lama = User.create!(name: 'Happy Lama', email: 'Happy_Lama@example.com')
    @duck = User.create!(name: 'Sad Duck', email: 'Sad_Duck@example.com')
    @horse = User.create!(name: 'Confused Horse', email: 'Confused_Horse@example.com')

    @lama_movie = Party.create!(movie_id: 1, duration_time: 127, start_date: Date.today, start_time: Time.now, user_id: @lama.id, movie_name: 'Jump for Joy')
    @lama_movie2 = Party.create!(movie_id: 3, duration_time: 127, start_date: Date.today, start_time: Time.now, user_id: @lama.id, movie_name: 'Jump for Joy 2')
    @inv_1 = UserParty.create!(user_id: @duck.id, party_id: @lama_movie.id)
    @inv_2 = UserParty.create!(user_id: @horse.id, party_id: @lama_movie.id)

    @duck_movie = Party.create!(movie_id: 2, duration_time: 90, start_date: Date.today, start_time: Time.now, user_id: @duck.id, movie_name: 'Deadpool')
    @inv_1 = UserParty.create!(user_id: @lama.id, party_id: @duck_movie.id)
    @inv_2 = UserParty.create!(user_id: @horse.id, party_id: @duck_movie.id)
  end

  it 'will show the movie attributes' do
    movie_id =  278
    visit "/users/#{@user.id}/movie/#{movie_id}"

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.vote_average)
    expect(page).to have_content(movie.display_runtime)
    expect(page).to have_content(movie.all_genere_names)
    expect(page).to have_content(movie.summary_description)
    expect(page).to have_content(movie.first_ten_cast_members)
    expect(page).to have_content(movie.count_total_reviews)
    expect(page).to have_content(movie.review_author)
    expect(page).to have_content(movie.review_content)
  end
end
