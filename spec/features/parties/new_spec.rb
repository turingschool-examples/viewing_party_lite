require 'rails_helper'

RSpec.describe 'a users new party creation page' do
  it 'displays the name of the movie title' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"

    expect(page).to have_content('The shawshank redemption')
  end

  it 'has a form with fields for duration, day, and start time' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"

    expect(page).to have_field(:duration)
    expect(page).to have_field(:date)
    expect(page).to have_field(:start_time)
  end
end


# fill_in :duration, with: '142'
# fill_in :date, with: Date.current
# fill_in :start_time: '00:54 PM'
