require 'spec_helper'

describe Note do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:notebook) }
  it { should belong_to(:author) }
  it { should belong_to(:notebook) }

  it { should have_many(:note_tags) }
  it { should have_many(:tags) }
  it { should have_many(:comments) }

  it "associates with the correct notebook before save via inverse of" do
    notebook = FactoryGirl.build(:notebook)
    note = notebook.notes.new
    expect(note.notebook).to eq(notebook)
  end

  it "associates with the correct author before save via inverse of" do
    user = FactoryGirl.build(:user)
    note = user.notes.new
    expect(note.author).to eq(user)
  end
end