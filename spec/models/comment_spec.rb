require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:note) }

  it { should belong_to(:author) }
  it { should belong_to(:note) }

  it "associates with the correct author before save via inverse of" do
    user = FactoryGirl.build(:user)
    comment = user.comments.new
    expect(comment.author).to eq(user)
  end

  it "associates with the correct note before save via inverse of" do
    note = FactoryGirl.build(:note)
    comment = note.comments.new
    expect(comment.note).to eq(note)
  end
end