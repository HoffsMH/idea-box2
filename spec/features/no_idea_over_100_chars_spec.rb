require 'rails_helper'

RSpec.feature "NoIdeaOver100Chars", type: :feature do
  it "will trim bodys around 100 characters to nearest work", js: true do
    visit "/"
    expect(page).to have_content("Title")

    fill_in "Title", with: "New Title"
    fill_in "Body:", with: " 5char 5char  5char 5char 5char 5char
                             5char 5char  5char 5char 5char 5char
                             5char 5char  5char 5char 5char 5char
                             5char 5char  5char 5char 5char 5char
                             5char 5char  5char 5char 5char 5char
                             we should not see this text"

    page.find('#submit-idea-btn').click
    
    expect(page).to have_content("New Title")
    expect(page).not_to have_content("we should not see this text")
    expect(page).to have_content(" 5char 5char  5char 5char 5char 5char")

  end
end
