require 'rails_helper'

feature 'admin deletes cleanup', %Q{

    As an admin
    I want to delete a cleanup
    So that there are no duplicates and so the app remains safe from malicious or offensive content

  } do

    let(:admin) { FactoryBot.create(:user, role: 'admin') }
    let!(:cleanup_1) { FactoryBot.create(:cleanup) }

    scenario 'admin deletes a cleanup' do
        login_as(admin)
        visit '/admin/cleanups'
        expect(page).to have_content(cleanup_1.title)
    
        within('table') do
            find(:css, 'tr', text: cleanup_1.posted_by).click_link('Delete')
          end

        expect(page).to have_content('Cleanup deleted')
    end
end
      