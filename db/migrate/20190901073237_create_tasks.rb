class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :deadline
      t.integer :position
      t.boolean :completed, default: false, null: false
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
