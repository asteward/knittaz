require 'rails_helper'

describe "the sign up process" do
  before :each do
    visit '/users/sign_up'
  end

  it "allows a user with the correct credentials to login" do
    DatabaseCleaner.clean
    test_user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Welcome, test'
  end

  # it "fails without an email" do
  #   fill_in 'Name', with: 'test'
  #   fill_in 'Handle', with: '#test'
  #   fill_in 'Password', with: 'password'
  #   fill_in 'Password confirmation', with: 'password'
  #   click_button 'Sign up'
  #   expect(page).to have_content "Email can't be blank"
  # end
end
