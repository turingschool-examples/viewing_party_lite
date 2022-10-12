require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :host }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of  :movie_id }
    it { should validate_presence_of :image_path }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :start_time }
  end

  describe 'relationships' do
    it { should have_many :viewing_party_users}
    it { should have_many(:users).through(:viewing_party_users)}
  end

  describe 'instance methods' do
    describe '#invited_users' do
      before :each do
        Faker::UniqueGenerator.clear
        @user = create(:user)
        @awesome_host = create(:user)
        @other_user = create(:user)
        #create 4 viewing parties each hosted by awesome_host
        @fun_viewing_party = create(:viewing_party, host: @awesome_host.user_name)
        #creates 3 viewing_party_users, one for other_user, one for the user, and one for the host for each viewing party
        create(:viewing_party_user, viewing_party: @fun_viewing_party, user: @user)
        create(:viewing_party_user, viewing_party: @fun_viewing_party, user: @other_user)
        create(:viewing_party_user, viewing_party: @fun_viewing_party, user: @awesome_host)
        @lonely_viewing_party = create(:viewing_party, host: @user.user_name)
        create(:viewing_party_user, viewing_party: @lonely_viewing_party, user: @user)

      end

      it 'lists users have been invited to the party except the host' do
        expect(@fun_viewing_party.invited_users).to eq([@user, @other_user])
        expect(@fun_viewing_party.invited_users).to_not include(@awesome_host)
      end
      
      context 'if no one has been invited' do
        it 'returns an empty array' do
          expect(@lonely_viewing_party.invited_users).to eq([])
        end
      end
    end
  end
end