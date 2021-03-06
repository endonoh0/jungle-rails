require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(
      first_name: 'Kanz',
      last_name: 'Sas',
      email: 'test@test.com',
      password: 'testing',
      password_confirmation: 'testing'
    )}

  describe "Validations" do

    it "Should persist the user" do
      expect(subject).to be_valid
    end

    context "Password: and Password_confirmation" do

      it "Should be invalid when the passwords do not match" do
        subject.password = "123456"
        subject.password_confirmation = "incorrect"
        expect(subject).to_not be_valid
      end

      it "Should be invalid when the password fields are undefined" do
        subject.password = nil
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end

      it "Should be invalid when the password is not at least 6 characters long" do
        expect(
          User.create(
            first_name: "Ben",
            last_name: "Jerry",
            email: "another@test.com",
            password: "1234",
            password_confirmation: "1234"
          )).to_not be_valid
      end
    end

    context "Email:" do

      it "Should be invalid when the email is not unqiue" do
        expect(
          User.create(
            first_name: "Ben",
            last_name: "Jerry",
            email: "TEST@test.com",
            password: "123456",
            password_confirmation: "123456"
          )).to_not be_valid
      end

      it "Should be invalid when the email is undefined" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end

  end

  describe '.authenticate_with_credentials' do

    it "Should login an authenticated user" do
      expect(subject).to be_valid
      subject.save
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to_not eq(nil)
    end

    it "Should login an user with trailing space in their email" do
      expect(subject).to be_valid
      subject.save
      expect(User.authenticate_with_credentials(' test@test.com ', subject.password)).to_not eq(nil)
    end

    it "Should login an user with the incorrect case for their email" do
      expect(subject).to be_valid
      subject.save
      expect(User.authenticate_with_credentials(' TEST@test.COM ', subject.password)).to_not eq(nil)
    end
  end

end
