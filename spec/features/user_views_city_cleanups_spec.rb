require 'rails_helper'

feature 'user views cleanup list for specific city', %Q{
    As an authenticated or unauthenticated user
    I want to view a list of all cleanups for a specific city
    So that I can select a cleanup for more information
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup_1) { FactoryBot.create(:cleanup, user: user) }

    scenario 'unauthenticated user sees cleanup list for specific city' do
        visit cleanups_path
        click_link 'New York'
        click_link 'Essex'

        expect(page).to have_content('Cleanups By City: Essex')
        expect(page).to have_content('Date')
        expect(page).to have_content(cleanup_1.title)
    end 

    scenario 'authenticated user sees cleanup list for specific city' do
        login_as(user, :scope => :user)
        visit cleanups_path
        click_link 'New York'
        click_link 'Essex'

        expect(page).to have_content('Cleanups By City: Essex')
        expect(page).to have_content('Date')
        expect(page).to have_content(cleanup_1.title)
        expect(page).to have_content('My Cleanups')
    end
end