class ViewingPartyUser < ApplicationRecord
    enum status: [:invited, :hosting]
    validates_presence_of :status

    belongs_to :user
    belongs_to :viewing_party
end 