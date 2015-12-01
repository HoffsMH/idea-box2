require 'rails_helper'

RSpec.feature "UserCanSeeForms", type: :feature do
  before(:each) do
    idea1 = Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
    idea2 = Idea.create(title: "this is a test title2", body: "this is a test body2", tags: {names: "hi there2"})
  end
  it "can see all teh featurez", js: true do
    visit "/"
    # expect(page).to have_content("title")
    # byebug
    expect(page).to have_content("this is a test title2")
  end
end
