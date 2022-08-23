require 'rails_helper'

RSpec.describe 'the User show page' do
  it 'shows the users name at the top of the page' do
    user1 = User.create!(name: 'Geraldo Rivera', email: 'geraldo@trashtv.com')
    user2 = User.create!(name: 'Maury Povich', email: 'maury@trashtv.com')
    user3 = User.create!(name: 'Jenny Jones', email: 'jenny@trashtv.com')

    visit user_path(user1)

    expect(page).to have_content("Geraldo Rivera's Dashboard")
  end
end
