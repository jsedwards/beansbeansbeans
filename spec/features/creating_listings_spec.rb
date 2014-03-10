require 'spec_helper'

feature 'Creating Listings' do 
  before do
    visit '/'
    click_link 'New Listing'
  end

  scenario 'can create a listing' do 

    fill_in 'Name', with: 'The Little Chihuahua'
    fill_in 'Description', with: 'Sustainably Farmed ingredients. Solid burritos'
    click_button 'Create Listing'
    expect(page).to have_content('Listing has been created')
  end

  scenario 'can not create a listing without a name' do 
    click_button 'Create Listing'
    expect(page).to have_content('Listing has not been created.')
    expect(page).to have_content('Name can\'t be blank')
  end
end