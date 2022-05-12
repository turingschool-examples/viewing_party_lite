require 'rails_helper'

describe 'create a new viewing party' do
  before do
    @user = User.create!(name: 'Brylan', email: 'brylan.gannon112@gmail.com')
    @user2 = User.create!(name: 'John', email: 'John.Hennerich@gmail.com')
    @movie_id = 550
    visit user_movie_path(@user,@movie_id)

    click_on 'Create Viewing Party'
  end

  context 'When vailid data is entered' do
    it 'Creates a viewing party ' do
      expect(page).to have_field(:duration, with: '139')
      select '5/12/2022', from: :date
      select '7:00', from: :time
      check 'John (John.Hennerich@gmail.com)'
      click_on 'Create Viewing Party'

      expect(current_path).to eq user_path(@user)

      within("#movie-#{@movie_id}") do
        expect(page).to have_content('Fight Club')
        expect(page).to have_content('May 12, 2022')
        expect(page).to have_content('7:00')
        expect(page).to have_content('Hosting')
      end

      visit user_path(@user2)

      within("#movie-#{@movie_id}") do
        expect(page).to have_content('Fight Club')
        expect(page).to have_content('May 12, 2022')
        expect(page).to have_content('7:00')
        expect(page).to have_content('Invited')
      end
    end
  end
end
