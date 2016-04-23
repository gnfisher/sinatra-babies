require 'spec_helper'

# A note
# These tests are very verbose and no doubt needless as mostly
# they confirm ActiveRecord is doing what it should - of course
# I am really just confirming that I am USING ActiveRecord as
# it should be used and practicing my spec-fu.

describe User do

  before do
    @user = User.new(email: "test@test.com", username: "tester", password: "password")
  end

  context 'invalid user inputs' do
    it "is invalid without an email" do
      @user.email.clear
      @user.valid?
      expect(@user.errors[:email].size).to eq(1) 
    end
    
    it "is invalid without a username" do
      @user.username.clear
      @user.valid?
      expect(@user.errors[:username].size).to eq(2)  
    end

    it "is invalid with incorrect password confirmation" do
      @user.password_confirmation = "notmypassword"
      @user.valid?
      expect(@user.errors[:password_confirmation].size).to eq(1)
    end
  end
end
