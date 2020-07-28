require 'rails_helper'

RSpec.feature "LoginUsers", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Joe',
      last_name: 'Dave',
      email: 'faker@email.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  scenario "User logins" do

    visit login_path

    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password

    find_button('Sign in').click

    expect(page).to have_text 'Signed in as Joe'

  end
end
