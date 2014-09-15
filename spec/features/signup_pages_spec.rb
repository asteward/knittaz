require 'rails_helper'

describe "the sign up process" do
  before :each do
    visit '/users/sign_up'
  end

  it "succeeds with a unique name, email, and password" do
    DatabaseCleaner.clean
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Name', with: 'test'
    fill_in 'Handle', with: '#test'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'test'
  end

  it "fails without an email" do
    DatabaseCleaner.clean
    fill_in 'Name', with: 'test'
    fill_in 'Handle', with: '#test'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end
