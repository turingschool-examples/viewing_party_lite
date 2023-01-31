require 'rails_helper'

RSpec.describe "user discover page" do
  before(:all) do
    @user = create(:user)
  end

  it 'displays the page title' do
    visit "/users/#{@user.id}/discover"

    expect(page).to have_content("Viewing Party")
    expect(page).to have_content("Discover Movies")
  end



end