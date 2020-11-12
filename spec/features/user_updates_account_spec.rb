require 'rails_helper'

feature 'user updates account', %Q{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up-to-date
} do

  scenario 'authenticated user updates account' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')

    click_link 'Edit Account'
    expect(page).to have_content('Edit User')
    
    fill_in 'Password', with: 'passwordy'
    fill_in 'Password confirmation', with: 'passwordy'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('Sign Out')
  end
end
