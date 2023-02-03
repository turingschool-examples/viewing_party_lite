class User < ApplicationRecord

  has_many :viewing_party_users
  has_many :viewing_parties

  
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true

  def self.all_except(user)
    where.not(id: user)
  end

  def name_and_email
    "#{name} (#{email})"
  end

  def invited
    self.viewing_party_users.map do |guest|
      guest.viewing_party
    end
  end

  def hosting
    self.viewing_parties
  end
  
end
