require "spec_helper"

feature "Deleting comments" do 
  let!(:listing) { FactoryGirl.create(:listing)}
  let!(:user) { FactoryGirl.create(:user) }
  let!(:comment) do 
    comment = FactoryGirl.create(:comment, listing: listing)
    comment.update(user: user)
    comment
  end


  before do 
    sign_in_as!(user)
    visit "/"
    click_link listing.name
    click_link comment.body
  end

  scenario "deleting a comment" do 
    click_link "Delete Comment"

    expect(page).to have_content("Comment has been deleted.")
    expect(page.current_url).to eq(listing_url(listing))
  end
end