class User < ApplicationRecord
    # encrypt password
  has_secure_password

  # Model associations
  has_many :animes, foreign_key: :title
  # Validations
  validates_presence_of :name, :rights, :password_digest
end
