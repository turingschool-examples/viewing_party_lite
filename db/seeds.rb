@johnny = User.create!(name: "Johnny", email: "j@jmail.com")
@sarah = User.create!(name: "Sarah", email: "sar@jmail.com")
@britt = User.create!(name: "Britt", email: "britt@jmail.com")

@party_1 = Party.create!(duration: 126, date: "3/22/22")

@party_user_1 = @johnny.parties.create!(is_host: true, party_id: @party_1.id)
@party_user_2 = @sarah.parties.create!(is_host: false, party_id: @party_1.id)
@party_user_3 = @britt.parties.create!(is_host: false, party_id: @party_1.id)
