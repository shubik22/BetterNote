require 'spec_helper'

describe Notebook do
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:name) }

  it "associates with the correct user before save via inverse of" do
    user = FactoryGirl.build(:user)
    notebook = user.notebooks.new
    expect(notebook.owner).to eq(user)
  end
end