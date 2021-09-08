class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:new, :create]

    #POST /login
    def create
        user = User.find_by(username: params[:username]) || User.find_by(username: params[:param][:username])
        if user && user.authenticate(params[:password]) || user && user.authenticate(params[:param][:password])
            session[:user_id] = user.id
            render json: { user: user }, status: :created
        else
            render json: { errors: ["Wrong Username or Password"] }, status: :unauthorized
        end
    end

    # DELETE /logout
    def destroy
        if session[:user_id]
            session.destroy
            render json: "Logout Successful"
        else
            render json: {errors: ["You are not logged in!"]}, status: :unauthorized
        end
    end
end
