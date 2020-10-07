require 'rails_helper'

feature 'authenticated user views personal cleanups', %Q{
  As an authenticated user
  I want to view a list of my logged cleanups
  So that I can keep track of the cleanups I have done
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup_1) { FactoryBot.create(:cleanup) }

    scenario 'see all my cleanups, most recently posted first' do
        visit cleanups_path
    
        expect(page).to have_content('Lake Champlain Cleanup Social')
        expect(page).to have_content('Mary Bennett')
        expect(page).to have_content('07/13/2020')
        expect(page).to have_content('NY')
        expect(page).to have_content('Essex')
        expect(page).to have_content('Coastal')
        expect(page).to have_content(4)
        expect(page).to have_content(9)
        expect(page).to have_content('Most common item was plastic bottles.')
      end
    end