require 'rails_helper'

feature 'user creates new cleanup', %Q{
  As an authenticated user
  I want to log a new cleanup
  So that others can view it
} do

    let(:user) { FactoryBot.create(:user) }

    scenario 'creates new cleanup' do
      login_as(user, :scope => :user)
      visit new_cleanup_path

      fill_in 'Title', with: 'Salem Cleanup Day 2020'
      fill_in 'Posted By', with: 'Nate Hawthorne'
      fill_in 'Date', with: '09/23/2020'
      fill_in 'State', with: 'MA'
      fill_in 'City', with: 'Salem'
      fill_in 'Cleanup Type', with: 'Coastal'
      fill_in 'Volunteers', with: 1
      fill_in 'Total Trash', with: 4
      fill_in 'Description', with: 'Most common items were fishing line and glass bottles.'
      click_button 'Submit'

      expect(page).to have_content('You logged a cleanup!')
      expect(page).to have_content('Salem Cleanup Day 2020')
      expect(page).to have_content('Nate Hawthorne')
      expect(page).to have_content('09/23/2020')
      expect(page).to have_content('MA')
      expect(page).to have_content('Salem')
      expect(page).to have_content('Coastal')
      expect(page).to have_content(1)
      expect(page).to have_content(4)
      expect(page).to have_content('Most common items were fishing line and glass bottles.')
    end

    scenario 'fail to specify cleanup metadata' do
      login_as(user, :scope => :user)
      visit new_cleanup_path

      click_button 'Submit'
      expect(page).to have_content('Please provide the following information before submitting: title, posted by, date, state, city, cleanup type, volunteers, total trash')
      expect(page).to_not have_content('You logged a cleanup!')
    end
  end
