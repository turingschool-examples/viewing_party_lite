require 'rails_helper'

RSpec.describe 'Discover', type: :feature do
  it 'Displays Top Movies' do
    user_1 = User.create(name: 'John Doe', email: 'JohnDoe@gmail.com')
    user_2 = User.create(name: 'Homer Simpson', email: 'HomerSimpson@gmail.com')

    visit "/users/#{user_1.id}/discover"

    expect(page).to have_content('Discover Movies')
    expect(page).to have_content('User: John Doe')
    expect(page).to have_no_content('User: Homer Simpson')
  end
end