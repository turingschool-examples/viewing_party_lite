require 'rails_helper'

RSpec.describe User, :vcr, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'instance methods' do
    context 'movie_cards_info' do
      it 'returns an array of MinMovies that are relevant to the user' do
        VCR.use_cassette('user#movies_cards_info', allow_playback_repeats: true) do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)

          party1 = create(:party, movie_id: 550)
          party2 = create(:party, movie_id: 56)
          party3 = create(:party, movie_id: 56)

          user_party1 = create(:user_party, user: user1, party: party1)
          user_party2 = create(:user_party, user: user1, party: party2)
          user_party3 = create(:user_party, user: user1, party: party3)
          user_party4 = create(:user_party, user: user2, party: party2)
          user_party5 = create(:user_party, user: user2, party: party3)

          expect(user1.movie_cards_info).to be_a Hash
          expect(user1.movie_cards_info.keys).to eq([party1.id, party2.id, party3.id])
          expect(user1.movie_cards_info.values[0].img_path).to eq(MovieFacade.movie_card(party1.movie_id).img_path)
          expect(user1.movie_cards_info.values[0].title).to be_a String
          expect(user1.movie_cards_info.values[0].id).to be_a Integer
          expect(user1.movie_cards_info.values[1].id).to eq(user1.movie_cards_info.values[2].id) # Checks parties w matching movies dont get erased

          expect(user2.movie_cards_info.count).to eq(2)
          
          expect(user3.movie_cards_info).to eq({})
        end
      end
    end
  end
end