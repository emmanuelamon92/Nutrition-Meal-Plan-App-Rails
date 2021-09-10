class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:new, :create]

    #POST /login
    def create
        user = User.find_by(username: params[:username]) || User.find_by(username: params[:param][:username])
        if user && user.authenticate(params[:password]) || user && user.authenticate(params[:param][:password])
            login!
            # session[:user_id] = user.id
            render json: { loggin_in: true, user: @user }
        else
            render json: { status: 401, errors: ['Wrong Username or Password'] }
        end
    end

    def is_logged_in?
        if logged_in? && current_user
            render json: {logged_in: true, user: current_user}
        else
            render json: {logged_in: false, message: ['No Such User']}
    end


    # DELETE /logout
    def destroy
        if session[:user_id]
            logout!
            render json: {status: 200, logged_out: true}
        end
    end

    def session_params
        params.require(:user).permit(:username, :password)
      end
end
