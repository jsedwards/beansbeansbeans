require 'spec_helper'

feature 'Editing Listings' do 
    before do
      sign_in_as!(FactoryGirl.create(:admin_user))
      FactoryGirl.create(:listing, name: 'Magnolia')
      visit '/'
      click_link 'Magnolia'
      click_link 'Edit Listing'
    end
  scenario 'Updating a Listing' do 

    fill_in "Name", with: "Magnolia, gastrobrewpub"
    click_button "Update Listing"

    expect(page).to have_content("Listing has been updated.")
  end

  scenario 'Updating a listing with invalid attributes is bad' do 
    fill_in "Name", with: ""
    click_button "Update Listing"

    expect(page).to have_content("Listing has not been updated.")
  end

end