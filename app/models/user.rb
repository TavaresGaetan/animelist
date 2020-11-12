class User < ApplicationRecord
  # model association
  has_many :animes, dependent: :destroy

  # validations
  validates_presence_of :name, :password, :rights 
end
