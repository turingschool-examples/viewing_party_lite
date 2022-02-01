require 'rails_helper'

RSpec.describe 'Discover show page' do

  xit "has list of existing users" do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    user_2 = User.create!(name: 'User 2', email: 'email2@gmail.com')
    user_3 = User.create!(name: 'User 3', email: 'email3@gmail.com')
    visit "/users/#{user_1.id}/discover"

    expect(page).to have_content("#{user_1.name} Discover")
  end

end
