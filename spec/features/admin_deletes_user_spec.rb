require 'rails_helper'

feature 'admin deletes user', %Q{

    As an admin
    I want to delete a user
    So that the app remains safe from users with malicious intent

  } do

  let(:admin) { FactoryBot.create(:user, role: 'admin') }
  let!(:user_2) { FactoryBot.create(:user) }

  scenario 'admin deletes user from users index' do
    login_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user_2.email)

    within('ol') do
      find(:css, 'li', text: user_2.email).click_link('Delete')
    end

    expect(page).to have_content('User deleted')
  end
end