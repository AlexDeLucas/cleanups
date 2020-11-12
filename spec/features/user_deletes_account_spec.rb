require 'rails_helper'

feature 'user deletes account', %Q{
  As an authenticated user
  I want to delete my account
  So that my information is not retained by the app
} do
  
  scenario 'authenticated user deletes account' do
    user = FactoryBot.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')

    click_link 'Edit Account'
    expect(page).to have_content('Edit User')
    expect(page).to have_content('Cancel my account')

    click_button 'Cancel my account'
    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
    expect(page).to have_content('Sign Up')
  end
end
