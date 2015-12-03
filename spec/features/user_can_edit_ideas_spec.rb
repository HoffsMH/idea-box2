require 'rails_helper'

RSpec.feature "UserCanEditIdeas", type: :feature do
  before(:each) do
    idea1 = Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
  end

  let!(:idea2) do
    Idea.create(title: "this is a test title2", body: "this is a test body2", quality: "genius", tags: {names: "hi there2"})
  end

  it "allows the user to edit title", js: true do
    visit "/"

    within(:css, "div.row.idea#idea-2") do
      expect(page).not_to have_content("updated title")
      expect(page).not_to have_content("updated body")
      page.find('.title-content').click

      fill_in "title", with: "updated title"
      # http://makandracards.com/makandra/12661-how-to-solve-selenium-focus-issues
      page.execute_script("$('input[name=title]').blur()")
      visit "/"
      expect(page).to have_content("updated title")
      expect(page).to_not have_content("this is a test title2")
    end
  end





  it "allows the user to edit the body", js: true do
    visit "/"

    within(:css, "div.row.idea#idea-2") do
      expect(page).not_to have_content("updated body")
      page.find('.body-content').click

      fill_in "body", with: "updated body"
      # http://makandracards.com/makandra/12661-how-to-solve-selenium-focus-issues
      page.execute_script("$('input[name=body]').blur()")
      visit "/"
      expect(page).to have_content("updated body")
      expect(page).to_not have_content("this is a test body2")
    end

  end

end
