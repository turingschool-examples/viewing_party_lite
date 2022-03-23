require 'rails_helper'

RSpec.describe 'User Show Spec' do
  before :each do
      @eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')
  end

  it 'has a button to discover movies' do
    visit user_path(@eldridge)

    expect(page).to have_content('Here are your upcoming Viewing Parties:')

    click_on 'Discover Movies'

    expect(current_path).to eq(user_discover_index_path(@eldridge))

  end
end
