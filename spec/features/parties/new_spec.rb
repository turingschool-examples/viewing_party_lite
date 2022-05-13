require 'rails_helper'

RSpec.describe 'a users new party creation page' do
  it 'displays the name of the movie title' do
    user_1 = User.create!(name: 'Will', email: '123@mail.com')

    visit "/users/#{user_1.id}/movies/278/viewing-party/new"

    expect(page).to have_content('The Shawshank Redemption')
  end
end
