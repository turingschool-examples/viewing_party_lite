require 'rails_helper'

RSpec.describe 'landing page' do
  before do
    @user_1 = User.create!(name: 'user_1', email: 'test_5@gmail.com')
    @user_2 = User.create!(name: 'user_2', email: 'test_3@gmail.com')
    @user_3 = User.create!(name: 'user_3', email: 'test_2@gmail.com')

    visit root_path
  end

  it 'has a link to redirect to root' do
    link = "Home"

    within '.links' do
      expect(page).to have_link(link)
    end

    click_link "Home"
    expect(page).to have_current_path(root_path)
  end

  it 'has an application title' do
    within '.title' do
      expect(page).to have_content('Viewing Party Lite')
    end
  end
end