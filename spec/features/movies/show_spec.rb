require 'rails_helper'

RSpec.describe 'movies show page' do
  before do
    @user = User.create!(name: "Haewon Jeon", email: "haewon201@gmail.com")

  end

  it 'has button to create viewing party' do
    VCR.use_cassette('movie_show') do
      visit user_movie_path(@user, 238)
      click_button 'Create a Viewing Party For This Movie'

      expect(current_path).to eq(new_party_path)
    end
  end

  it 'has button to create viewing party' do
    VCR.use_cassette('movie_show') do
      visit user_movie_path(@user, 238)
      click_button 'Create a Viewing Party For This Movie'

      expect(current_path).to eq(new_party_path)
    end
  end
end
