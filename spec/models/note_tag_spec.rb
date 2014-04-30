require 'spec_helper'

describe NoteTag do
  it { should validate_presence_of(:note) }
  it { should validate_presence_of(:tag) }

  it "associates with the correct note before save via inverse of" do
    note = FactoryGirl.build(:note)
    note_tag = note.note_tags.new
    expect(note_tag.note).to eq(note)
  end

  it "associates with the correct tag before save via inverse of" do
    tag = FactoryGirl.build(:tag)
    note_tag = tag.note_tags.new
    expect(note_tag.tag).to eq(tag)
  end
end