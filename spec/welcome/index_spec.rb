require 'rails_helper'

RSpec.describe 'Landing Page' do
  let(:users) { create_list(:user, 10) }

  it 'Has all relevant content' do
    visit root_path
    expect(page).to have_content('Viewing Party')
    expect(page).to have_content(users.first.email)
    expect(page).to have_content(users.last.email)
    expect(page).to have_content(users.shuffle.shuffle.last.email)
  end

  it 'has a has a create button' do
    visit root_path
    expect(page).to have_button('Create a New User', :href => new_user_path)
  end

  it 'has navigation link' do
    visit root_path
    expect(page).to have_link('Back to Home', href: root_path)
  end
end