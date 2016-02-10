class CreateChoreCompletions < ActiveRecord::Migration
  def change
    create_table :chore_completions do |t|
      t.belongs_to :chore, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    remove_column :chores, :last_completed
  end
end
