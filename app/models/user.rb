class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates_uniqueness_of :email

  def hosting
    viewing_parties.where("user_viewing_parties.status = 'Hosting'")
  end

  def invited_to
    viewing_parties.where("user_viewing_parties.status = 'Invited'")
  end
end
