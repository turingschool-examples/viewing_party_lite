require 'rails_helper'

RSpec.describe '#new', :vcr do
  it 'has a working form' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')
    dawn = User.create!(name: 'Dawn', email: 'Dawn.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit new_user_movie_viewing_party_path(jose, 278)

    within '#form' do
      fill_in 'viewing_party[duration]', with: '200'
      fill_in 'viewing_party[date]', with: Date.today
      fill_in 'viewing_party[time]', with: 1600
      find(:css, "#viewing_party_invites_#{dawn.id}").set(true)

      click_on 'Create Viewing party'
    end

    expect(current_path).to eq(user_path(jose))
  end
end
