class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  #http://www.chrisrolle.com/en/blog/boolean-attribute-validation
end
