require 'spec_helper'

describe Tag do
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:owner) }

  it { should have_many(:note_tags) }
  it { should have_many(:notes) }

  it "associates with the correct user before save via inverse of" do
    user = FactoryGirl.build(:user)
    tag = user.tags.new
    expect(tag.owner).to eq(user)
  end
end