require 'rails_helper'

RSpec.describe 'User show page' do

  it "checks that the users name is on the page " do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    visit user_path(user_1)
    expect(page).to have_content("#{user_1.name}'s Dashboard")

  end
end
