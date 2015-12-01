require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    let!(:valid_attributes) do
      {
        email: "some_dude@somedude.com",
        title: "valid title",
        quality: "genius",
        body: "valid body",
        tags: {
          names: ["these", "are", "valid", "tags"]
        }
      }
    end

    it "is valid with valid attributes" do
      idea = Idea.new(valid_attributes)

      expect(idea).to be_valid
    end


    it "is not valid without a title" do
      nil_title = valid_attributes
      nil_title[:title] = nil

      idea = Idea.new(nil_title)

      expect(idea).not_to be_valid

      blank_title = valid_attributes
      blank_title[:title] = ""

      idea = Idea.new(blank_title)

      expect(idea).not_to be_valid
    end

    it "is not valid without a body" do
      nil_body = valid_attributes
      nil_body[:body] = nil

      idea = Idea.new(nil_body)

      expect(idea).not_to be_valid

      blank_body = valid_attributes
      blank_body[:body] = ""

      idea = Idea.new(blank_body)

      expect(idea).not_to be_valid
    end

  end
end
