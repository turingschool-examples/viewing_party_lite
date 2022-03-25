require "rails_helper"

RSpec.describe 'The User Dashboard' do
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

    it "has a button that goes to discover movies page on persons dashboard" do
      visit  user_path(@lama)

      expect(page).to have_content("#{@lama.name}'s Dashboard")

      click_button("Discover Movies")

      expect(current_path).to eq("/users/#{@lama.id}/discover")
    end

    it "has invites and hosting sections" do
      visit  user_path(@lama)

      expect(page).to have_content('Viewing Parties')

      within('.hosting') do
        expect(page).to have_content(@lama_movie.movie_name)
        expect(page).to have_content(@lama_movie.start_date.strftime('%D'))
        expect(page).to have_content(@lama_movie.start_time.strftime('%r'))
      end

      within('.invite') do
        expect(page).to have_content(@duck_movie.movie_name)
        expect(page).to have_content(@duck_movie.start_date.strftime('%D'))
        expect(page).to have_content(@duck_movie.start_time.strftime('%r'))
      end
    end
end
