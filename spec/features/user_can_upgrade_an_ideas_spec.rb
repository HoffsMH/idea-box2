require 'rails_helper'

RSpec.feature "UserCanUpgradeAnIdeas", type: :feature do
  before(:each) do
    idea1 = Idea.create(title: "this is a test title", body: "this is a test body", tags: {names: "hi there"})
  end

  let!(:idea2) do
    Idea.create(title: "this is a test title2", body: "this is a test body2", tags: {names: "hi there2"})
  end

  it "allows the user to upgrade an idea quality", js: true do
    visit "/"

    within(:css, "div.row.idea#idea-2") do
      expect(page).to have_content("swill")
      expect(page).not_to have_content("plausible")
      expect(page).not_to have_content("genius")

      #first upgrade
      page.find('.rate-btn-up').click

      expect(page).not_to have_content("swil")
      expect(page).to have_content("plausible")
      expect(page).not_to have_content("genius")

      #second upgrade
      page.find('.rate-btn-up').click

      expect(page).not_to have_content("swil")
      expect(page).not_to have_content("plausible")
      expect(page).to have_content("genius")

      #third upgrade
      page.find('.rate-btn-up').click

      #doesn't go back to swill
      expect(page).not_to have_content("swil")
      expect(page).not_to have_content("plausible")
      expect(page).to have_content("genius")
    end

  end

end
