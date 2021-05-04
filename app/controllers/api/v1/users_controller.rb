class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all 
        render json: @users, except: [:password_digest, :created_at, :updated_at], include: [:stores, :items], status: 200
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            render json: @user, status: 200
        else 
            render json: { errors: @user.errors.full_messages }, status: 400
        end
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
        if @user
            render json: @user, except: [:password_digest, :created_at, :updated_at], status: 200
        end
    end

    def destroy
        @user.destroy
        head :no_content
    end

    private
        def user_params
            params.require(:user).permit(:username, :password, :password_confirmation)
        end
end