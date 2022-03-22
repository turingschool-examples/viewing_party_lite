require 'rails_helper'

RSpec.describe 'New user' do
  before :each do

  end

  it 'can create a new user' do
    visit '/register'

    fill_in 'Name', with: 'Happy Lama'
    fill_in 'Email', with: 'Happy_Lama@example.com'
    click_button 'Create User'

    lama = User.last

    expect(current_path).to eq("/users/#{lama.id}")
    expect(page).to have_content(lama.name)
    expect(page).to have_content(lama.email)
  end

end
