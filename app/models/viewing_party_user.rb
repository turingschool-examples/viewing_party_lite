# frozen_string_literal: true

class ViewingPartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_presence_of :user_id, :viewing_party_id, :is_host
end
