require 'rails_helper'

RSpec.feature "UserCanFilterIdeas", type: :feature do
  before(:each) do
    Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
    Idea.create(title: "this is a test title1", body: "this is a test body1", tags: {names: "hi there"})
    Idea.create(title: "this is a test title2", body: "this is a test body2", tags: {names: "hi there"})
    Idea.create(title: "this is a test title3", body: "this is a test body3", tags: {names: "hi there"})
  end

  let!(:idea) do
    Idea.create(title: "we are searching for this idea", body: "asldfkjas;lfdkajsdfa FiLTer teXtasdfasdfasdfsafsa", quality: "genius", tags: {names: "hi there2"})
  end

  it "allows the user to filter for ideas case insensitive", js: true do
    visit "/"

    # expect(page).to have_content("Title")
    #
    # binding.pry
    fill_in "search", with: "FILTER TEXT"

    expect(page).to_not have_content("this is a test title")
    expect(page).to_not have_content("this is a test title1")
    expect(page).to_not have_content("this is a test title2")
    expect(page).to_not have_content("this is a test title3")
    expect(page).to have_content("we are searching for this idea")
    expect(page).to have_content( "asldfkjas;lfdkajsdfa FiLTer teXtasdfasdfasdfsafsa")
  end
end
