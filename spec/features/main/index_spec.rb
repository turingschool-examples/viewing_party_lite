require 'rails_helper'

RSpec.describe 'Main page' do
  it 'has project title' do
    visit '/'

    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_link('Home')
  end
end
