class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :email
      t.string :title
      t.integer :quality
      t.string :body
      t.hstore :tags

      t.timestamps null: false
    end
  end
end
