require 'rails_helper'

feature 'user views national list for cleanups', %Q{
    As an authenticated or unauthenticated user
    I want to view a list of all U.S. states where there are cleanups
    So that I can select a state for more information
} do

    let(:user) { FactoryBot.create(:user) }

    scenario 'unauthenticated user visits View Cleanups and see links for all U.S. states and territories' do
        visit root_path
        click_link 'View Cleanups'

        expect(page).to have_content('Cleanups By State')
        expect(page).to have_content('Mid Atlantic')
        expect(page).to have_content('Iowa')
        expect(page).to have_content('Montana')
    end

    scenario 'authenticated user visits View Cleanups and see links for all U.S. states and territories' do
        login_as(user, :scope => :user)
        visit root_path
        click_link 'View Cleanups'

        expect(page).to have_content('Cleanups By State')
        expect(page).to have_content('Mid Atlantic')
        expect(page).to have_content('Iowa')
        expect(page).to have_content('Montana')
        expect(page).to have_content('My Cleanups')
    end
end

