class Anime < ApplicationRecord
  belongs_to :user

  
  validates_presence_of :title,:author,:type,:rating,:releasedate,:episodenumber,:image
end
