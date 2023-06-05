module Api
  class TodoListsController < ApplicationController
    # GET /api/todolists
    def index
      @todo_lists = TodoList.all

      respond_to :json
    end

    # GET /api/todolists/:id
    def show
      todo_list = TodoList.find(params[:id])

      render json: {
        id: todo_list.id, 
        name: todo_list.name, 
        todo_lists_items: todo_list.todo_lists_items
      }, status: :ok
    end

    # POST /api/todolists
    def create 
      todo_list = TodoList.create(todo_list_params)
  
      todos_description = params[:todo_lists_item][:descriptions]

      todos_description.each do |todo_description|
        todo_list.todo_lists_items.create(description: todo_description)
      end

      render json: todo_list, status: :ok
    end

    # PUT /api/todolists/:id
    def update 
      todo_list = TodoList.find(params[:id])

      todo_list.update(todo_list_params)
      render json: todo_list
    end

    # DELETE /api/todolists/:id
    def destroy
      todo_list = TodoList.find(params[:id])

      todo_list.destroy
      render json: { message: "Record successfully deleted."}, status: :ok
    end

    private

    def todo_list_params
      params.require(:todo_list).permit(:name, todo_lists_item: [descriptions: []])
    end
    
  end
end
