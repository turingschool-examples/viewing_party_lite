# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Page' do
  it 'discover button' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')

    visit user_path(@user1.id)


    click_button "Discover Movies"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end


end
