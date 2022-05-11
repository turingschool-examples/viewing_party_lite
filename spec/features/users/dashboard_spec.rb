require 'rails_helper'

RSpec.describe 'a user dashboard' do
  it 'displays a header with the users name' do
    user_1 = User.create!(name: 'Buggs', email: 'buggs@bunny.com')

    visit "/users/#{user_1.id}"

    expect(page).to have_content("Buggs's Dashboard")
  end    
end
