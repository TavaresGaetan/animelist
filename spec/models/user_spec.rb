require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:animes).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:rights) }
end
