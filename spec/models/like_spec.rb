require 'spec_helper'

describe Like do
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:note) }
  it { should validate_uniqueness_of(:owner).scoped_to(:note) }

  it "associates with the correct user before save via inverse of" do
    user = FactoryGirl.build(:user)
    like = user.likes.new
    expect(like.owner).to eq(user)
  end
end