class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates_presence_of :name, :email
  validates :email, uniqueness: true

  def parties_invited_to
    parties
  end

  def parties_hosting
    Party.where("host_id = #{id}")
  end
end
