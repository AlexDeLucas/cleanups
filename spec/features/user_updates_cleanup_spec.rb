require 'rails_helper'

feature 'user updates cleanup', %Q{
  As an authenticated user
  I want to update a cleanup’s data
  So that I can correct errors or provide new information
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup_2) { FactoryBot.create(:cleanup, user: user) }

    scenario 'update cleanup' do
        login_as(user, :scope => :user)
        visit cleanup_path(cleanup_2)
        click_on 'Edit'
    
    fill_in 'Posted By', with: 'Mr. Collins'
    fill_in 'State', with: 'NY'
    fill_in 'City', with: 'Port Kent'
    fill_in 'Total Trash Collected', with: 16
    fill_in 'Description', with: 'We cleaned up a lot of litter!'
    click_button 'Save Changes'

    expect(page).to have_content('Cleanup successfully updated!')
    expect(page).to have_content('Mr. Collins')
    expect(page).to have_content('NY')
    expect(page).to have_content('Port Kent')
    expect(page).to have_content(16)
    expect(page).to have_content('We cleaned up a lot of litter!')

    end
end