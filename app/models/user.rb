class User < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :name, :email, :password, :password_digest
  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password_confirmation

  #needed to allow bcrypt to create a passowrd_digest from password input
  has_secure_password

  #rails does this automatically
  # def passwords_match?(user_params)
  #   user_params[:password] == user_params[:password_confirmation]
  # end
end
