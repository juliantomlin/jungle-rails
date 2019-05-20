require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'Validations' do

  it "should return a valid user" do

    user2 = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude2.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )

    user2.save

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude5.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )
    expect(user).to be_valid
  end

  it "should not be valid if missing first name" do

    user = User.new(
      first_name: nil,
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )
    expect(user).to_not be_valid
  end

  it "should not be valid if missing last name" do

    user = User.new(
      first_name: 'guy',
      last_name: nil,
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )
    expect(user).to_not be_valid
  end

  it "should not be valid if missing e_mail" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: nil,
      password: "hunter2",
      password_confirmation: "hunter2"
      )
    expect(user).to_not be_valid
  end

  it "should not be valid if missing password" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: nil,
      password_confirmation: "hunter2"
      )
    expect(user).to_not be_valid
  end

  it "should not be valid if missing password confirmation" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: nil
      )
    expect(user).to_not be_valid
  end
  it "should not be valid if password confirmation does not match password" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: "hunter3"
      )
    expect(user).to_not be_valid
  end

  it "should not be valid if e-mail is not unique" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )

    user.save

    user2 = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )
    expect(user2).to_not be_valid
  end

  it "should not be valid if e-mail is not unique (case insensitive)" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "GUY@DUDE.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )

    user.save

    user2 = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )
    expect(user2).to_not be_valid
  end

  it "should not be valid if password is less than 7 characters long" do

    user = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude.com",
      password: "hunter",
      password_confirmation: "hunter"
      )
    expect(user).to_not be_valid
  end
 end

 describe '.authenticate_with_credentials' do
  user3 = User.new(
      first_name: 'guy',
      last_name: 'dude',
      e_mail: "guy@dude3.com",
      password: "hunter2",
      password_confirmation: "hunter2"
      )

  user3.save

  it 'should not return nil' do
    userTest = User.authenticate_with_credentials("guy@dude3.com", "hunter2")
    expect(userTest).to_not be_nil
  end

  it 'should return nil if the password is wrong' do
    userTest = User.authenticate_with_credentials("guy@dude3.com", "hunter3")
    expect(userTest).to be_nil
  end

  it 'should return nil if the e-mail does not exist' do
    userTest = User.authenticate_with_credentials("guy@nonexistant.com", "hunter2")
    expect(userTest).to be_nil
  end

  it 'should not return nil if the e_mail is in a different case' do
    userTest = User.authenticate_with_credentials("GUY@DUDE3.com", "hunter2")
    expect(userTest).to_not be_nil
  end

  it 'should not return nil if the e_mail has extra spaces before and after' do
    userTest = User.authenticate_with_credentials("  guy@dude3.com  ", "hunter2")
    expect(userTest).to_not be_nil
  end
 end


end
