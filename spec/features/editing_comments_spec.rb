require "spec_helper"

feature "Editing Comments" do 
let!(:listing) { FactoryGirl.create(:listing)}
let!(:user) { FactoryGirl.create(:user)}
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
    click_link "Edit Comment"
  end

  scenario "Updating a comment" do 
    fill_in "Body", with: "My updated comment on the listing"
    click_button "Update Comment"

    expect(page).to have_content "Comment has been updated."
    
    within("#comment") do 
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
