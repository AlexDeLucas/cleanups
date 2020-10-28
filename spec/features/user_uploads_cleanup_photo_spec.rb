require 'rails_helper'

feature 'authenticated user uploads a photo from a cleanup', %Q{

  As an authenticated user
  I want to upload an image file
  So that others can see photos from my cleanup

} do

  let(:user) { FactoryBot.create(:user) }

  scenario 'uploads photo when posting cleanup' do
    login_as(user, :scope => :user)
    visit new_cleanup_path

    fill_in 'Title*', with: 'Beach Cleanup at Ausable Point'
      fill_in 'Posted By*', with: 'Tanya M.'
      fill_in 'Date*', with: '2020-09-22'
      select 'New York', from: 'State*'
      fill_in 'City*', with: 'Ausable'
      choose 'Coastal'
      fill_in 'Number of Volunteers', with: 1
      fill_in 'Total Trash (lbs.)', with: 5
      fill_in 'Description', with: 'Most common items were aluminum cans.'
      attach_file :cleanup_cleanup_photo, "#{Rails.root}/cleanups/spec/support/images/Ausable_Point_Beach.jpg"
      click_button 'Log Cleanup'


    expect(page).to have_content('You logged a cleanup!')
    expect(page).to have_content('Beach Cleanup at Ausable Point')
    expect(page).to have_content('Tanya M.')
    expect(page).to have_content(5)
    expect(page).to have_css("img[src*='Ausable_Point_Beach.jpg']")
  end
end