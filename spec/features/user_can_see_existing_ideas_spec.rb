require 'rails_helper'

RSpec.feature "UserCanSeeExistingIdeas", type: :feature do
  before(:each) do
    idea1 = Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
    idea2 = Idea.create(title: "this is a test title2", body: "this is a test body2", tags: {names: "hi there2"})
  end
  it "displays already existing ideas after loading page", js: true do
    visit "/"

    expect(page).to have_content("this is a test title")
    expect(page).to have_content("this is a test body")
    expect(page).to have_content("this is a test title2")
    expect(page).to have_content("this is a test body2")
  end
end
