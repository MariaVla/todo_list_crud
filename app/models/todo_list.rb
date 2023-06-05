class TodoList < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :todo_lists_items, dependent: :destroy
end