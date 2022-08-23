require 'rails_helper'

RSpec.describe 'the landing page' do
  it 'shows a list of all users as links to their dashboard' do
    user1 = User.create!(name: 'Geraldo Rivera', email: 'geraldo@trashtv.com')
    user2 = User.create!(name: 'Maury Povich', email: 'maury@trashtv.com')
    user3 = User.create!(name: 'Jenny Jones', email: 'jenny@trashtv.com')

    visit root_path

    within "#user-#{user1.id}" do
      expect(page).to have_link('Geraldo Rivera')
    end

    within "#user-#{user2.id}" do
      expect(page).to have_link('Maury Povich')
    end

    within "#user-#{user3.id}" do
      expect(page).to have_link('Jenny Jones')
    end

    click_link('Geraldo Rivera')
    expect(current_path).to eq("/users/#{user1.id}")
  end
end
