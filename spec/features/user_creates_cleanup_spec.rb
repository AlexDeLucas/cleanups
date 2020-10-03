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

    fill_in 'Date', with: '09/23/20'
    fill_in 'Location', with: 'Salem, MA'
    fill_in 'Volunteers', with: 1
    fill_in 'Total Trash Collected', with: 4
    fill_in 'Description', with: 'Did this as a solo beach cleanup. Not too much litter on this stretch. Most common items were aluminum cans and cigarette butts.'
    click_button 'Submit'

    expect(page).to have_content('You logged a cleanup!')
    expect(page).to have_content('09/23/20')
    expect(page).to have_content('Salem, MA')
    expect(page).to have_content(1)
    expect(page).to have_content(4)
    expect(page).to have_content('Did this as a solo beach cleanup. Not too much litter on this stretch. Most common items were aluminum cans and cigarette butts.')
  end

  scenario 'specify invalid cleanup metadata' do
    login_as(user, :scope => :user)
    visit new_cleanup_path

    fill_in 'Date', with: '40/50/20'
    fill_in 'Location', with: '3'
    fill_in 'Volunteers', with: .5
    fill_in 'Total Trash Collected', with: -2
    click_button 'Submit'

    expect(page).to have_content('Please enter a valid date using format: month/day/year')
    expect(page).to have_content('Please enter a valid location using format: city or town, state abbreviation')
    expect(page).to have_content('Number of volunteers must be at least 1 and be a positive, whole number')
    expect(page).to have_content('Total trash collected must be at least 1 and be a positive, whole number')
    expect(page).to_not have_content('You logged a cleanup!')
  end

  scenario 'fail to specify cleanup metadata' do
    login_as(user, :scope => :user)
    visit new_cleanup_path

    click_button 'Submit'
    expect(page).to have_content('Please fill out the following information: date, location, number of volunteers, total trash collected')
    expect(page).to_not have_content('You logged a cleanup!')
  end
end
