require 'spec_helper'

describe FriendRequest do
  it { should validate_presence_of(:in_friend) }
  it { should validate_presence_of(:out_friend) }

  it { should belong_to(:in_friend) }
  it { should belong_to(:out_friend) }
end
