require 'rails_helper'

describe Api::TodoListsController do
  render_views

  describe 'GET index' do
    let!(:todo_list) { TodoList.create(name: 'Setup RoR project') }

    context 'when format is HTML' do
      it 'raises a routing error' do
        expect {
          get :index
        }.to raise_error(ActionController::RoutingError, 'Not supported format')
      end
    end

    context 'when format is JSON' do
      it 'returns a success code' do
        get :index, format: :json

        expect(response.status).to eq(200)
      end

      it 'includes todo list records' do
        get :index, format: :json

        todo_lists = JSON.parse(response.body)

        aggregate_failures 'includes the id and name' do
          expect(todo_lists.count).to eq(1)
          expect(todo_lists[0].keys).to match_array(['id', 'name'])
          expect(todo_lists[0]['id']).to eq(todo_list.id)
          expect(todo_lists[0]['name']).to eq(todo_list.name)
        end
      end
    end
  end

  describe 'Create Todo List' do
    let!(:todo_list) { TodoList.create(name: 'My todo list') }
    let!(:todo_1) { TodoListsItem.create(description: 'todo 1', todo_list_id: todo_list.id) }
    let!(:todo_2) { TodoListsItem.create(description: 'todo 2', todo_list_id: todo_list.id) }

    context 'when format is JSON' do
      it "todo list named created correctly" do  
        expect(todo_list.name).to eq('My todo list')
      end

      it "todo lists item created correclty in the todo list" do  
        expect(todo_list.todo_lists_items.count).to eq(2)
        expect(todo_1.todo_list_id).to eq(todo_list.id)
      end

      it "todo lists item created with completed false" do  
        expect(todo_1.completed).to eq(false)
      end
    end
  end
end
