require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  it 'exists' do
    visit "/"
    expect(current_path).to eq("/")
    expect(page).to have_content("Viewing Party PRO")
  end
end
