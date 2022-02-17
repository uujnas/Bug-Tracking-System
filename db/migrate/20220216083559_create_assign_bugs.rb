class CreateAssignBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :assign_bugs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bug, null: false, foreign_key: true

      t.timestamps
    end
  end
end
