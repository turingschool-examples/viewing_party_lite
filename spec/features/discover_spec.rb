require 'rails_helper'

RSpec.describe 'Discover', type: :feature do
  it 'Displays Top Movies' do
    user_1 = User.create(name: 'John Doe', email: 'JohnDoe@gmail.com')

    visit "/users/#{user_1.id}/discover"

    expect(page).to have_content('Discover Movies')
  end
end