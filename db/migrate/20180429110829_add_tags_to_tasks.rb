class AddTagsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :tags, :text
  end
end
