# frozen_string_literal: true

class ViewParty < ApplicationRecord
  has_many :user_view_parties
  has_many :users, through: :user_view_parties

  validates :movie_id, :movie_name, :duration, :datetime, presence: true
  validate :datetime_cannot_be_in_the_past

  def datetime_cannot_be_in_the_past
    errors.add(:datetime, 'cannot be in the past') if datetime.present? && datetime < DateTime.now
  end

  def file_path
    MovieFacade.movie_by_id(movie_id).poster_path
  end

  def host?(user)
    user_view_parties.find_by(user_id: user.id).host
  end

  def members
    User.where(id: user_view_parties.pluck('user_id'))
  end
end
