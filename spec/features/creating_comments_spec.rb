require "spec_helper"

feature "Creating comments" do 
  before do 
    FactoryGirl.create(:listing, name: "Little Chihuahua")

    visit "/"
    click_link "Little Chihuahua"
    click_link "New Comment"
  end

  scenario "Creating a comment" do 
    fill_in "Body", with: "Great burritos"
    fill_in "Tip", with: "Try the Plaintain Black Bean Burrito"
    click_button "Create Comment"
    expect(page).to have_content("Comment has been created.")
  end

  scenario "Creating a comment without valid attributes fails" do 
    click_button "Create Comment"
    expect(page).to have_content("Comment has not been created.")
    expect(page).to have_content("Body can't be blank")
  end
end