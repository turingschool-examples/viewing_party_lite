require 'rails_helper'

RSpec.describe 'Discover Index Page' do

  it 'has movie information' do
    eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')

    visit user_discover_index_path(eldridge)

    expect(page).to have_content('Discover Movies')
  end
end
