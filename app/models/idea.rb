class Idea < ActiveRecord::Base
  enum quality: ["swill", "plausible", "genius"]

  validates :title, presence: true
  validates :body, presence: true
end
