require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'has form to register new user' do
    visit '/register'

    fill_in :name, with: 'Gandalf'
    fill_in :email, with: 'gandalfthegrey@wizard'

    click_on 'Register'

    expect(current_path).to eq("/users/#{User.all.last.id}")
  end
end
