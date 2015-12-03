class Idea < ActiveRecord::Base
  enum quality: ["swill", "plausible", "genius"]

  validates :title, presence: true
  validates :body, presence: true

  def json_hash
    output = attributes
    output["quality"] = quality
    output
  end

  def upgrade
    current = attributes["quality"]
    if current < 2
      update(quality: current + 1 )
    end
  end

  def downgrade
    current = attributes["quality"]
    if current > 0
      update(quality: current - 1 )
    end
  end

  def change_rating(direction)
    {
      "up"   =>  proc {upgrade},
      "down" =>  proc {downgrade},
      nil    =>  proc {false}
    }[direction].call
  end

  def edit_title(new_title)
    update()

  end


end
