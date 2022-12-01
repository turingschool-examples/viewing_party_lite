# frozen_string_literal: true

class ViewParty < ApplicationRecord
  has_many :user_view_parties
  has_many :users, through: :user_view_parties

  validates :movie_id, :movie_name, :duration, :datetime, presence: true

  validate :datetime_cannot_be_in_the_past

  def datetime_cannot_be_in_the_past
    if datetime.present? && datetime < Date.today
      errors.add(:datetime, "cannot be in the past")
    end
  end

  def file_path
    MovieFacade.posters(self).url
  end

  def host?(user)
    self.user_view_parties.find_by(user_id: user.id).host
  end
end
