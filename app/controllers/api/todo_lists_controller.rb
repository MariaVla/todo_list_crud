module Api
  class TodoListsController < ApplicationController
    # GET /api/todolists
    def index
      @todo_lists = TodoList.all

      respond_to :json
    end

    # POST /api/todolists
    def create 
      todo_list = TodoList.create(todo_list_params)

      render json: todo_list
    end

    # PUT /api/todolists/:id
    def update 
      todo_list = TodoList.find(params[:id])

      # if todo_list
        todo_list.update(todo_list_params)
        render json: todo_list
      # else
      #   # raise ActiveRecord::RecordNotFound
      #   render json: { message: "Record not found." }, status: :not_found
      # end
    end
 

    # DELETE /api/todolists/:id
    def destroy
      todo_list = TodoList.find(params[:id])

      todo_list.destroy
      render json: { message: "Record successfully deleted."}, status: :ok

    # rescue ActiveRecord::RecordNotFound
    #   render json: { message: "Record not found." }, status: :not_found
    end

    private

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
    
  end
end
