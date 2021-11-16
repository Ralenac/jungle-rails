require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    user = User.new(first_name: "tea", last_name: "bloom", email: "tea.bloom@gmail.com", password: "password", password_confirmation: "password")

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    #password
    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
    it "is not valid without a password confirmation" do
      user.password_confirmation = nil
      expect(user).to_not be_valid
    end
    it "is not valid when password and password confirmation don't match" do
      user.password_confirmation = "PASSWORD"
      expect(user).to_not be_valid
    end
    it "is not valid when password has less than 5 caracters" do
      user.password_confirmation.length <= 5
      expect(user).to_not be_valid
    end

    #email
    it "is not valid without a email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a first name" do
      user.first_name = nil
      expect(user).to_not be_valid
    end
    it "is not valid without a last name" do
      user.last_name = nil
      expect(user).to_not be_valid
    end


  end

  describe '.authenticate_with_credentials' do
    user = User.new(first_name: "tea", last_name: "bloom", email: "tea.bloom@gmail.com", password: "password", password_confirmation: "password")
    user.save

    it "returns user if user exist " do
      valid_user = user.authenticate_with_credentials("tea.bloom@gmail.com", "password")
      expect(valid_user).to_not be_nil
    end
    it "returns nil is user doesn't exist" do
      valid_user = user.authenticate_with_credentials("wrong", "password")
      expect(valid_user).to be_nil 
    end
    it "return nil if the password is incorrect" do
      valid_user = user.authenticate_with_credentials("tea.bloom@gmail.com", "wrong")
      expect(valid_user).to be_nil 
    end

  end
  
end




