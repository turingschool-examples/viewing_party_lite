require 'rails_helper'

RSpec.describe 'Landing Page' do
  let!(:users) { create_list(:user, 10) }

  it 'Has all relevant content' do
    visit root_path

    random_user = users.shuffle.shuffle.last
    expect(page).to have_content('Viewing Party')
    expect(page).to have_link(users.first.email, href: user_path(users.first))
    expect(page).to have_link(users.last.email, href: user_path(users.last))
    expect(page).to have_link(random_user.email, href: user_path(random_user))
  end

  it 'has a has a create button' do
    visit root_path
    click_button('Create a New User')

    expect(current_path).to eq(new_user_path)
  end

  it 'has navigation link' do
    visit root_path
    expect(page).to have_link('Back to Home', href: root_path)
  end
end