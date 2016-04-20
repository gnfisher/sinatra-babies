require 'spec_helper'

describe User do

  before do
    @user = User.new(email: "test@test.com", username: "tester", password: "password")
  end

  it "is invalid without an email" do
    @user.email.clear
    @user.valid?
    expect(@user.errors[:email].size).to eq(1) 
  end
  
  it "is invalid without a username"
end
