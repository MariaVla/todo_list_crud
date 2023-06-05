class TodoListsItem < ApplicationRecord
  validates :description, presence: true

  belongs_to :todo_list
end
