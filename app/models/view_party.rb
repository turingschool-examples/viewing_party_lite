# frozen_string_literal: true

class ViewParty < ApplicationRecord
  has_many :user_view_parties
  has_many :users, through: :user_view_parties

  def file_path
    MovieFacade.posters(self).url
  end

  def host?(user)
    self.user_view_parties.find_by(user_id: user.id).host
  end
end
