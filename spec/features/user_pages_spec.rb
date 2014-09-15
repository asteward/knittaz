require 'rails_helper'

describe "the sign up process" do
  before :each do
    DatabaseCleaner.clean
    visit '/users/sign_up'
    test_user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it "navigates to the user's page via the navbar" do
    click_link 'Account'
    click_link 'My Yarns'
    expect(page).to have_content '- yarns -'
  end

  it "navigates to the user's page via the 'Ready to spin some yarns?' link" do
    click_link 'Ready to spin some yarns?'
    expect(page).to have_content '- yarns -'
  end

end
