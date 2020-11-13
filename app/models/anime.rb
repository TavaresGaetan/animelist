class Anime < ApplicationRecord
  validates_presence_of :title,:author,:genre,:rating,:releasedate,:episodenumber,:image
end
