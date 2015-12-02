require 'rails_helper'

RSpec.feature "UserCanSeeForms", type: :feature do
  before(:each) do
    idea1 = Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
    idea2 = Idea.create(title: "this is a test title2", body: "this is a test body2", tags: {names: "hi there2"})
  end
  it "it displays a form to make a new idea", js: true do
    visit "/"
    expect(page).to have_content("Title")

    expect(page).to  have_selector("a[id=submit-idea-btn]")
    expect(page).to  have_selector("input[id=idea_tags]")
    expect(page).to  have_selector("textarea[id=idea_body]")
    expect(page).to  have_selector("input[id=idea_title]")
    expect(page).to have_content("this is a test title2")
  end
end
