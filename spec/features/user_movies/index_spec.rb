require 'rails_helper'

RSpec.describe 'Movies Results Page' do 
    context "When I visit the discover movies page,
    " do 
        before :each do
            @user1 = User.create!(name: 'Jared', email: 'jared@example.com')
            visit "users/#{@user1.id}/discover"
        end

        it 'I see' do
            
        end
    end
end