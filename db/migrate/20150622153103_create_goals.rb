class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content, null: false
      t.integer :author_id, null: false
      t.boolean :private, null: false, default: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end

    add_index :goals, :author_id
  end
end
