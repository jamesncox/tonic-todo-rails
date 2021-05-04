class Api::V1::SessionsController < ApplicationController

    def auth_check
        render json: {csrf_auth_token: form_authenticity_token}
    end

    def create
        @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                render json: @user, status: 200
            else 
                render json: { errors: ["Unable to log in. Username and Password are case-sensitive. Check credentials and please try again."] }, status: 400
            end
    end

    def destroy
        session.clear
    end

end