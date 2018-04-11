class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, default: ''
      t.integer :position, default: 1
      t.text :notes, default: ''

      t.datetime :due_at
      t.datetime :completed_at
      t.datetime :skipped_at

      t.timestamps
    end
  end
end
