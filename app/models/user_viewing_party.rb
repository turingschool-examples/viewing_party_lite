class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_inclusion_of :host, in: [true, false]

  def host_user
    UserViewingParty.where(viewing_party_id: viewing_party_id).where("host = true").first.user.name
  end
end