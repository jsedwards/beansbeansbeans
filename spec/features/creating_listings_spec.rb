require 'spec_helper'

feature 'Creating Listings' do 
  scenario 'can create a listing' do 
    visit '/'
    click_link 'New Listing'
    fill_in 'Name', with: 'The Little Chihuahua'
    fill_in 'Description', with: 'Sustainably Farmed ingredients. Solid burritos'
    click_button 'Create Listing'
    expect(page).to have_content('Listing has been created')
  end
end