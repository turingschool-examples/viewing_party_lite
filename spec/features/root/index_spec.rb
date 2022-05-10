require 'rails_helper'

RSpec.describe 'landing page' do
  before do
    @user_1 = User.create!(name: 'user_1', email: 'test_5@gmail.com')
    @user_2 = User.create!(name: 'user_2', email: 'test_3@gmail.com')
    @user_3 = User.create!(name: 'user_3', email: 'test_2@gmail.com')

    visit root_path
  end
  it 'has an application title' do
    within '.title' do
      expect(page).to have_content('Viewing Page Party')
    end
  end
end