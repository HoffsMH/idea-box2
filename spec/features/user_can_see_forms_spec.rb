require 'rails_helper'

RSpec.feature "UserCanSeeForms", type: :feature do
  it "it displays a form to make a new idea", js: true do
    visit "/"
    expect(page).to have_content("Title")

    expect(page).to  have_selector("a[id=submit-idea-btn]")
    expect(page).to  have_selector("input[id=idea_tags]")
    expect(page).to  have_selector("textarea[id=idea_body]")
    expect(page).to  have_selector("input[id=idea_title]")
  end
end
