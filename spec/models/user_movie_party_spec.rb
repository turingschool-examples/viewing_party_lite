require 'rails_helper'

RSpec.describe UserMovieParty do
    describe 'validations' do
        it { should validate_presence_of(:status) }
     end

     describe 'relationships' do
        it { should belong_to(:user) }
        it { should belong_to(:movie_party) }
     end
end