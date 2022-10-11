# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User show page' do
  before :each do
    @user = User.create(name: 'Sunny', email: 'sunny@email.com')

    visit user_path(@user.id)
  end
  it 'has the users name at top' do
    expect(page).to have_content("Sunny's Dashboard Page")
  end
  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
  end
end
