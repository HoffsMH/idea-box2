class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :email, default: "johndoe@johndoe.com"
      t.string :title
      t.integer :quality, default: 0
      t.string :body
      t.hstore :tags

      t.timestamps null: false
    end
  end
end
