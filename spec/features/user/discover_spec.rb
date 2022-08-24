require 'rails_helper'

RSpec.describe 'user discover discover' do
  before :each do
    @user = User.create!(name: 'tom', email: 'tom@tom.com')

    visit "/users/#{@user.id}/discover"
  end


  it "has a button to see top rated movies" do
    expect(page).to have_button('Top Rated Movies')
    click_button 'Top Rated Movies'
    expect(current_path).to eq("/users/#{@user.id}/movies")
  end

end
