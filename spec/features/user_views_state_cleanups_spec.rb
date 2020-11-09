require 'rails_helper'

feature 'user views cleanup list for specific state', %Q{
    As an authenticated or unauthenticated user
    I want to view a list of all cities with cleanups for a specific state
    So that I can select a city for more information
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup_1) { FactoryBot.create(:cleanup, user: user) }

    scenario 'unauthenticated user sees cleanup cities for specific state' do
        visit cleanups_path
        click_link 'New York'


        expect(page).to have_content('Cleanups By State/Territory: NY')
        expect(page).to have_content('Essex')
    end 

    scenario 'authenticated user sees cleanup cities for specific state' do
        login_as(user, :scope => :user)
        visit cleanups_path
        click_link 'New York'
        
        expect(page).to have_content('Cleanups By State/Territory: NY')
        expect(page).to have_content('Essex')
        expect(page).to have_content('My Cleanups')
    end
end