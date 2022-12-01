require 'rails_helper'

RSpec.describe 'application layout', :vcr do
  let(:user) { create(:user) }
  let(:movie_id) { rand(1.200) }
  let(:routes) do
    # I'm so sorry for this absolute monstrosity
    Rails.application.routes.routes
         .flat_map { |r| r.path.spec.to_s }
         .uniq
         .map { |path| path.gsub('(.:format)', '') }
         .select { |path| path == '/' || path == '/register' || path.include?('users') }
         .map do |path|
           if path.include?(':user_id')
             path.gsub(':id', movie_id.to_s)
             path.gsub(':user_id', user.id.to_s)
           else
             path.gsub(':id', user.id.to_s)
           end
         end
  end
  describe 'header content' do
    it 'has a link "Home" back to landing page' do
      routes.each do |path|
        visit path
        within '#nav' do
          expect(page).to have_link('Home', href: '/')
        end
      end
    end
  end
end
