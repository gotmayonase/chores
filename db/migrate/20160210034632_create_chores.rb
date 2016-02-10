class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.integer :interval, default: 0
      t.belongs_to :user
      t.datetime :last_completed

      t.timestamps null: false
    end
  end
end
