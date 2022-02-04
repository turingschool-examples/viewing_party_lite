class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration
  validates_presence_of :day
  validates_presence_of :start_time

  def find_invitee(params)
    all_users = User.all
    all_users.select do |user|
      params.keys.include?(user.email)
    end
  end

end
