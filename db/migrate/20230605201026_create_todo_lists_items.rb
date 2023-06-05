class CreateTodoListsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_lists_items do |t|
      t.text :description, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
