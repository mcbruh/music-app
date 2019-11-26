require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject(:user) do
    FactoryBot.build(:user,
    email: "testing@testemail.com",
    password: "testpassword")
  end
 
  it { should validate_presence_of(:email) }
  #it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    expect(user.session_token).to_not be_nil
  end

  describe "#is_password?" do
    it "should return true if password is correct" do
      expect(user.is_password?("testpassword")).to be true
    end

    it "should return false if password is not correct" do
      expect(user.is_password?("badpassword")).to be false
    end
  end

  describe "#reset_session_token" do
    it "should set new session token on user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "should return new session token on user" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do

    before { user.save! }

    it "should return user given correct credentials" do
      expect(User.find_by_credentials("testing@testemail.com", "testpassword")).to eq(user)
    end

    it "should return nil given bad credentials" do
      expect(User.find_by_credentials("bademail@email.com", "badpassword")).to eq(nil)
    end
  end

end


