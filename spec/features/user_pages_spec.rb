require 'rails_helper'

describe "the sign up process", :js => true do
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

  it "creates a new post" do
    click_link 'Ready to spin some yarns?'
    click_link 'spin a new yarn'
    fill_in 'post_text', with: 'New yarn'
    click_button 'spin yarn'
    expect(page).to have_content 'New yarn'
  end

  it "fails to create a new post if no text is input" do
    click_link 'Ready to spin some yarns?'
    click_link 'spin a new yarn'
    click_button 'spin yarn'
    expect(page).to have_content 'Spin Yarn Here'
  end

  it "follows another user" do
    click_link 'Account'
    click_link 'Logout'
    click_link 'Account'
    click_link 'Do you love to knit?'
    fill_in 'Email', with: 'test2@test.com'
    fill_in 'Name', with: 'test2'
    fill_in 'Handle', with: '#test2'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    fill_in 'search-term', with: "test"
    click_button 'search-btn'
    click_link '#test'
    click_link 'follow'
    
    expect(page).to have_content 'unfollow'
  end

end
