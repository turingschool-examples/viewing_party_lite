require 'rails_helper'

RSpec.describe 'Viewing Party New' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  it 'can create a new viewing party' do
    visit new_user_movie_viewing_party_path(user, 238)
    
    expect(page).to have_field('viewing_party[duration]', with: 175 )
    fill_in('user[name]', with: 'Samuel Cox')
    fill_in('user[email]', with: 'samuel@example.com')
    click_button('Register')

    expect(User.exists?(name: 'Samuel Cox')).to eq true
    expect(User.exists?(email: 'samuel@example.com')).to eq true
  end
end