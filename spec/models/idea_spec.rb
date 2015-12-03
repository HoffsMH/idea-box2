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

    it "has a default quality of swill" do
      no_quality = valid_attributes
      no_quality.delete(:quality)
      idea = Idea.new(no_quality)

      expect(idea.quality).to eq("swill")
    end

  end

  context "upgrading and Down grading" do
    let!(:valid_attributes) do
      {
        email: "some_dude@somedude.com",
        title: "valid title",
        quality: "swill",
        body: "valid body",
        tags: {
          names: ["these", "are", "valid", "tags"]
        }
      }
    end

    it "can upgrade an idea" do
      idea = Idea.new(valid_attributes)
      expect(idea.quality).to eq("swill")

      idea.upgrade
      expect(idea.quality).to eq("plausible")

      idea.upgrade
      expect(idea.quality).to eq("genius")
    end

    it "can downgrade an idea" do
      genius_attributes = valid_attributes
      genius_attributes[:quality] = "genius"

      idea = Idea.new(genius_attributes)
      expect(idea.quality).to eq("genius")

      idea.downgrade
      expect(idea.quality).to eq("plausible")

      idea.downgrade
      expect(idea.quality).to eq("swill")
    end

    it "can do both using #change_rating"  do
      plausible_attributes = valid_attributes
      plausible_attributes[:quality] = "plausible"

      idea = Idea.new(plausible_attributes)
      expect(idea.quality).to eq("plausible")

      idea.change_rating("down")
      expect(idea.quality).to eq("swill")

      idea.change_rating("up")
      expect(idea.quality).to eq("plausible")
    end
  end
end
