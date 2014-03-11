require "spec_helper"

feature "Editing Comments" do 

  before do 
  listing = FactoryGirl.create(:listing)
  comment = FactoryGirl.create(:comment, listing: listing)
    visit "/"
    click_link listing.name
    click_link comment.body
    click_link "Edit Comment"
  end

  scenario "Updating a comment" do 
    fill_in "Body", with: "My updated comment on the listing"
    click_button "Update Comment"

    expect(page).to have_content "Comment has been updated."
    
    within("#comment p") do 
      expect(page).to have_content("My updated comment on the listing")
    end

    expect(page).to_not have_content "Example comment"
  end

  scenario "Updating a comment with invalid information" do 
    fill_in "Body", with: ""
    click_button "Update Comment"

    expect(page).to have_content("Comment has not been updated")
  end
end
