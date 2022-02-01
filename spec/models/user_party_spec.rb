require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe "relations" do
    it { should belong_to(:party)}
    it { should belong_to(:user)}
  end

  it 'can return movie for user party' do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    movie_1 = Movie.create!(title: 'Movie 1', vote_average: 7.0, runtime: 120, genre: 'genre 1', summary: 'summary 1', cast_members: 'cast members 1', total_review_count: 1, review_information: 'review information 1')
    party_1 = Party.create!(duration: 120, date: '2022-10-1', start_time: '19:00:00', movie_id: movie_1.id)

    user_party_11 = UserParty.create!(user_id: user_1.id, party_id: party_1.id, host: true)

    expect(user_party_11.user_party_movie).to eq(movie_1)
  end
end
