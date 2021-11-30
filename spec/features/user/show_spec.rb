require 'rails_helper'

RSpec.describe "user show" do
  it 'shows user details' do
    user = User.new(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')

    visit "/user/#{user.id}"

    expect(page).to have_content("Tammy Tanaka's Dashboard")
  end
end
