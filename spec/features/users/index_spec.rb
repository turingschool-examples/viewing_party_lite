require 'rails_helper'

RSpec.describe 'users dashboard' do
  let!(:user1) { User.create(name: 'Jeff', email: 'jeff@email.com') }
  let!(:user2) { User.create(name: 'Amy', email: 'amy@email.com') }

  before(:each) do
    visit users_path
  end

  it 'has user names as links to show page' do
    expect(page).to have_content('Jeff')
    expect(page).to have_content('Amy')

    click_link 'Jeff'

    expect(current_path).to eq user_path(user1)
  end
end
