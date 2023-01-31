require 'rails_helper'

RSpec.describe "The Discover Movies Page" do
  before :each do
    @user = User.create!(name: "John Cena", email: "johnc@email.com")
  end

  it 'is accessed from a button on a users show page' do
    visit user_path(@user)

    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(@user))
  end
end