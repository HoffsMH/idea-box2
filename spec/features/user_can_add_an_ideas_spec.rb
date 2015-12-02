require 'rails_helper'

RSpec.feature "UserCanAddAnIdeas", type: :feature do
  it "will let the user create a new idea and display it", js: true do
    visit "/"
    expect(page).to have_content("Title")

    fill_in "Title", with: "New Title"
    fill_in "Body:", with: "New Body"

    page.find('#submit-idea-btn').click

    expect(page).to have_content("New Title")
    expect(page).to have_content("New Body")
  end
end
