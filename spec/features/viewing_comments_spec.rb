require "spec_helper"

feature "Viewing Comments" do 
  before do 
    user = FactoryGirl.create(:user)
    sign_in_as!(user)
    magnolia = FactoryGirl.create(:listing, name: "Magnolia")
    comment1 = FactoryGirl.create(:comment,
                        listing: magnolia,
                        body: "A really good brewpub",
                        tip: "$4 pints on Tuesdays")
    comment1.update(user: user)
    ragazza = FactoryGirl.create(:listing, name: "Ragazza")
    comment2 = FactoryGirl.create(:comment,
                        listing: ragazza,
                        body: "A rotating menu of exceptional pizza pies",
                        tip: "Add an egg for a special treat")
    comment2.update(user: user)

    visit "/"
  end

  scenario "Viewing comments for a given listing" do 
    click_link "Magnolia"
    expect(page).to have_content("A really good brewpub")
    expect(page).to_not have_content("A rotating menu of exceptional pizza pies")
    click_link "A really good brewpub"
    within("#comment") do 
      expect(page).to have_content("A really good brewpub")
    end

    expect(page).to have_content("$4 pints on Tuesdays")
  end
end
