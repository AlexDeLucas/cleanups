require 'rails_helper'

feature 'admin can see a list of users' , %Q{

    As an admin
    I want to view a list of all users
    So that I know who is using the site
  
  } do

  let(:admin) { FactoryBot.create(:user, role: 'admin') }
  let!(:user) { FactoryBot.create(:user) }

  scenario 'admin visits users index' do
    login_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user.email)
  end

  scenario 'unauthorized users are redirected' do
    login_as(user)
    visit '/admin/users'
    expect(page).to have_content('Access denied')
    expect(current_path).to eq(root_path)
  end
end