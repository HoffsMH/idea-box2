require 'rails_helper'

RSpec.feature "UserCanDeleteIdeas", type: :feature do
  before(:each) do
    idea1 = Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
  end

  let!(:idea2) do
    Idea.create(title: "this is a test title2", body: "this is a test body2", tags: {names: "hi there2"})
  end

  it "allows the user to upgrade an idea quality", js: true do
    visit "/"
    within(:css, "div.row.idea#idea-2") do
      expect(page).to have_content("this is a test body2")
      expect(page).to have_content("this is a test title2")
      page.find('.delete-idea-btn').click
    end
    expect(page).not_to have_content("this is a test body2")
    expect(page).not_to have_content("this is a test title2")
  end
end
