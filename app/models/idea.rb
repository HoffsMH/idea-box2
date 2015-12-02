class Idea < ActiveRecord::Base
  enum quality: ["swill", "plausible", "genius"]

  validates :title, presence: true
  validates :body, presence: true

  def json_hash
    output = attributes
    output["quality"] = quality
    output
  end
end
