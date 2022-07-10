require 'rails_helper'

RSpec.describe '#new', :vcr do
  it 'has a working form' do
    jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                        password_confirmation: '111')

    visit new_user_movie_viewing_party_path(jose, 278)
  end
end
