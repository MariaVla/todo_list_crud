module Api
  class TodoListsItemsController < ApplicationController

    # PUT /api/todolistsitems/:id
    def update
      todo_lists_item = TodoListsItem.find(params[:id])

      todo_lists_item.update(todo_lists_item_params)
      render json: todo_lists_item
    end

    # DELETE /api/todolistsitems/:id
    def destroy
      todo_list = TodoListsItem.find(params[:id])

      todo_list.destroy
      render json: { message: "Record successfully deleted."}, status: :ok
    end

    private

    def todo_lists_item_params
      params.require(:todo_lists_item).permit(:description, :completed)
    end

  end
end
