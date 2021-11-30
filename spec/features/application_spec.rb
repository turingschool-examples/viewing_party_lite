require 'rails_helper'

RSpec.describe 'welcome page' do
  it "displays a link to the homepage" do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_content('Viewing Party')
  end
end
