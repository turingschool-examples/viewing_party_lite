# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserParty.destroy_all
User.destroy_all
ViewingParty.destroy_all 

@vp1 = create(:viewing_party)
@vp2 = create(:viewing_party)
@vp3 = create(:viewing_party)
@vp4 = create(:viewing_party)
@vp5 = create(:viewing_party)
@vp6 = create(:viewing_party)
@vp7 = create(:viewing_party)
@vp8 = create(:viewing_party)
@vp9 = create(:viewing_party)
@vp10 = create(:viewing_party)

@user1 = create(:user) 
@user2 = create(:user) 
@user3 = create(:user) 
@user4 = create(:user) 
@user5 = create(:user) 
@user6 = create(:user) 
@user7 = create(:user) 
@user8 = create(:user) 
@user9 = create(:user) 
@user10 = create(:user) 

@up1 = create(:user_party, viewing_party_id: @vp1, user_id: @user1)
@up2 = create(:user_party, viewing_party_id: @vp1, user_id: @user2)
@up3 = create(:user_party, viewing_party_id: @vp1, user_id: @user3)
@up4 = create(:user_party, viewing_party_id: @vp1, user_id: @user4)
@up5 = create(:user_party, viewing_party_id: @vp1, user_id: @user5)
@up6 = create(:user_party, viewing_party_id: @vp2, user_id: @user6)
@up7 = create(:user_party, viewing_party_id: @vp2, user_id: @user7)
@up8 = create(:user_party, viewing_party_id: @vp3, user_id: @user8)
@up9 = create(:user_party, viewing_party_id: @vp3, user_id: @user9)
@up10 = create(:user_party, viewing_party_id: @vp4, user_id: @user10)
@up11 = create(:user_party, viewing_party_id: @vp4, user_id: @user1)
@up12 = create(:user_party, viewing_party_id: @vp5, user_id: @user2)
@up13 = create(:user_party, viewing_party_id: @vp5, user_id: @user3)
@up14 = create(:user_party, viewing_party_id: @vp5, user_id: @user4)
@up15 = create(:user_party, viewing_party_id: @vp6, user_id: @user5)
@up16 = create(:user_party, viewing_party_id: @vp6, user_id: @user6)
@up17 = create(:user_party, viewing_party_id: @vp7, user_id: @user7)
@up18 = create(:user_party, viewing_party_id: @vp7, user_id: @user8)
@up19 = create(:user_party, viewing_party_id: @vp8, user_id: @user9)
@up20 = create(:user_party, viewing_party_id: @vp8, user_id: @user10)
@up21 = create(:user_party, viewing_party_id: @vp8, user_id: @user1)
@up22 = create(:user_party, viewing_party_id: @vp9, user_id: @user2)
@up23 = create(:user_party, viewing_party_id: @vp9, user_id: @user3)
@up24 = create(:user_party, viewing_party_id: @vp10, user_id: @user4)
@up25 = create(:user_party, viewing_party_id: @vp10, user_id: @user5)