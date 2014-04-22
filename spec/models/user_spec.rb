require 'spec_helper'

describe User do
  subject(:user) do
    FactoryGirl.build(:user,
    username: "Bob",
    email: "bob@example.com",
    password: "good_password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should ensure_length_of(:password).is_at_least(6) }

  it { should have_many(:notes) }
  it { should have_many(:notebooks) }
  it { should have_many(:tags) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }
  it { should have_many(:friends) }
  it { should have_many(:friendships) }
  it { should have_many(:friend_requests) }
  it { should have_many(:pending_friends) }

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "gives the user a new session token" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "matches the correct password" do
      expect(user.is_password?("good_password")).to be_true
    end

    it "does not match an incorrect password" do
      expect(user.is_password?("bad_password")).to be_false
    end
  end

  describe "find_by_credentials" do
    before { user.save! }

    it "returns the user for the correct email/password pair" do
      expect(User.find_by_credentials("bob@example.com",
        "good_password")).to eq(user)
    end

    it "returns nil when the email is incorrect" do
      expect(User.find_by_credentials("b@example.com", "")).to be_nil
    end

    it "returns nil if the password is incorrect" do
      expect(User.find_by_credentials("bob@example.com",
        "bad_password")).to be_nil
    end
  end
end