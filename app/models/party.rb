class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates :duration,
            :presence => {message: "can't be blank"}
  validates :day,
            :presence => {message: "can't be blank"}
  validates :start_time,
            :presence => {message: "can't be blank"}

  def find_invitee(params)
    all_users = User.all
    all_users.select do |user|
      params.keys.include?(user.email)
    end
  end

end
