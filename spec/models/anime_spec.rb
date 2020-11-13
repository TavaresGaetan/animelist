require 'rails_helper'

RSpec.describe Anime, type: :model do

  it { should belong_to(:anime) }

  it { should validate_presence_of(:title,:author,:genre,:rating,:releasedate,:episodenumber,:image) }
end
