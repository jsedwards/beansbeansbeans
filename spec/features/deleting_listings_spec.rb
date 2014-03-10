require 'spec_helper'

feature "Deleting Listings" do 
  scenario "Deleting a listing" do 
    FactoryGirl.create(:listing, name: "Magnolia")
    visit "/"
    click_link "Magnolia"
    click_link "Delete Listing"
    expect(page).to have_content("Listing has been deleted.")
    
    visit "/"
    expect(page).to have_no_content("Magnolia")
  end
end