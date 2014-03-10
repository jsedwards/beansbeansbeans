require 'spec_helper'

feature 'Viewing Listings' do 
  scenario 'Seeing all listings' do 
    listing = FactoryGirl.create(:listing, name: 'Magnolia')
    visit '/'
    click_link 'Magnolia'
    expect(page.current_url).to eql(listing_url(listing))
  end
end