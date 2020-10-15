require 'rails_helper'

feature 'user deletes cleanup', %Q{
  As an authenticated user
  I want to delete a cleanup
  So that no one can view it
} do

    let(:user) { FactoryBot.create(:user) }
    let!(:cleanup) { FactoryBot.create(:cleanup, user: user) }

    scenario 'deletes a cleanup' do
      login_as(user, :scope => :user)
      visit cleanup_path(cleanup)

      click_link 'Edit Cleanup'
      click_on 'Delete'

      expect(page).to have_content('Cleanup deleted')
    end
end 
    