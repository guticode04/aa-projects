require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) {create(:user)}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:password).is_at_least(6) }
  # it { should have_many(:goals) }

  it "creates a password_digest when password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session_token before validation" do 
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "resets new ssession_token to the user" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_token)
    end

    it "returns new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "checks if password is correct" do
      expect(user.is_password?("1234567")).to be true
    end

    it "checks if password is incorrect" do
      expect(user.is_password?("gustavo")).to be false
    end
  end

  describe "::find_by_credentials" do
    it "checks whether email/password is a match" do
      expect(User.find_by_credentials(user.email, user.password)).to eq(user)
    end

    it "returns nil for unmatched email/password" do
      expect(User.find_by_credentials(user.email, "gustavo")).to eq(nil)
    end

  end

end
