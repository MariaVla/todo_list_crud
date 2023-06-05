class AddTodoListReferenceToTodoListsItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :todo_lists_items, :todo_list, null: false, foreign_key: true
  end
end
