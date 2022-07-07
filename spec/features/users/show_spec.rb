require 'rails_helper'

RSpec.describe 'user dashboard page' do
  it 'has users name' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    visit "/users/#{user.id}"

    expect(page).to have_content("Tommy Tanktop's Dashboard")
  end

  it 'has a button to discover movies' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    visit "/users/#{user.id}"

    expect(page).to have_button('Discover Movies')
  end

  # it 'has a section that lists viewing parties' do
  #   user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')
  #   vparty1 = Party.new(host: )
  #     visit "/users/#{user.id}"

  #   expect(page).to have_content('Discover Movies')
  # end
end
