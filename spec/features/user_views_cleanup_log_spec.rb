require 'rails_helper'

feature 'user views log for specific cleanup', %Q{
    As an authenticated or unauthenticated user
    I want to view a log for a specific cleanup
    So that I can see all the cleanup data and details
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup_1) { FactoryBot.create(:cleanup, user: user) }

    scenario 'unauthenticated user sees cleanup log' do
        visit cleanups_path
        click_link 'New York'
        click_link 'Essex'
        click_link cleanup_1.title

        expect(page).to have_content('Cleanup Log')
        expect(page).to have_content('Posted By')
        expect(page).to have_content(cleanup_1.cleanup_type)
        expect(page).to have_content(cleanup_1.volunteers)
    end 

    scenario 'authenticated user sees cleanup log' do
        login_as(user, :scope => :user)
        visit cleanups_path
        click_link 'New York'
        click_link 'Essex'
        click_link cleanup_1.title

        expect(page).to have_content('Cleanup Log')
        expect(page).to have_content('Posted By')
        expect(page).to have_content(cleanup_1.cleanup_type)
        expect(page).to have_content(cleanup_1.volunteers)
        expect(page).to have_content('My Cleanups')
    end
end