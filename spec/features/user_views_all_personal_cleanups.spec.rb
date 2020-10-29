require 'rails_helper'

feature 'authenticated user views their own cleanups', %Q{
  As an authenticated user
  I want to view a complete list of my cleanups
  So that I can keep track of the cleanups I have done
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup_1) { FactoryBot.create(:cleanup) }

    scenario 'see all my cleanups by title, most recently posted first' do
      login_as(user, :scope => :user)
      visit user_path
    
      expect(page).to have_content('My Cleanups')
      expect(page).to have_content('Lake Champlain Cleanup Social')
    end
  end