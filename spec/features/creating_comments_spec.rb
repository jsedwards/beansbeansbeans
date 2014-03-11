require "spec_helper"

feature "Creating comments" do 
  before do 

    listing = FactoryGirl.create(:listing)
    user = FactoryGirl.create(:user)
    visit "/"
    click_link listing.name
    click_link "New Comment"
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)

    fill_in "Name", with: user.name
    fill_in "Password", with: user.password 
    click_button "Sign in"
    click_link listing.name
    click_link "New Comment"
  end

  scenario "Creating a comment" do 
    fill_in "Body", with: "Great burritos"
    fill_in "Tip", with: "Try the Plaintain Black Bean Burrito"
    click_button "Create Comment"
    expect(page).to have_content("Comment has been created.")
    within "#comment #author" do 
      expect(page).to have_content("Created by Example User")
    end
  end

  scenario "Creating a comment without valid attributes fails" do 
    click_button "Create Comment"
    expect(page).to have_content("Comment has not been created.")
    expect(page).to have_content("Body can't be blank")
  end

  scenario "Comment body must be longer than 10 characters" do 
    fill_in "Body", with: "Not enuf"
    click_button "Create Comment"
    expect(page).to have_content("Comment has not been created.")
    expect(page).to have_content("Body is too short")
  end
end