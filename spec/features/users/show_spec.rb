require 'rails_helper'

RSpec.describe '#show', :vcr do
  it 'has button to discover movies' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit dashboard_path

    click_on 'Discover Movies'

    expect(current_path).to eq(user_movies_discover_path(jose))
  end

  it 'has the users name' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit dashboard_path

    expect(page).to have_content("#{jose.name}'s Dashboard")
  end

  it 'has a section that lists viewing parties' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')
    frank = User.create!(name: 'Frank', email: 'frank.andres@gmail.com', password: '111',
                         password_confirmation: '111')

    party = ViewingParty.create!({ duration: 150, date: Date.today, time: 1600, movie_id: 278 })

    PartyUser.create!({ user_id: jose.id, viewing_party_id: party.id,
                        host: true })
    PartyUser.create!({ user_id: frank.id, viewing_party_id: party.id,
                        host: false })

    visit dashboard_path

    within '#movie-278' do
      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg']")
      expect(page).to have_content('The Shawshank Redemption')
      expect(page).to have_content(party.date.strftime('%B %d, %Y'))
      expect(page).to have_content(party.time)
      expect(page).to have_content('Hosting')
      expect(page).to have_content('Jose Andres')
      expect(page).to have_content('Frank')
    end
  end
end
