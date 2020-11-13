class User < ApplicationRecord
  # validations
  validates_presence_of :name, :password, :rights 
end
