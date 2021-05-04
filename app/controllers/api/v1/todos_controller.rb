class Api::V1::TodosController < ApplicationController


    private
        def todo_params
            params.require(:todo).permit(:title, :done, :user_id)
        end 
end