class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:new, :create]
    wrap_parameters :user, include: [:username, :password, :password_confirmation]

    #POST /login
    def create
        # user = User.find_by(username: params[:username]) || User.find_by(username: params[:param][:username])
        @user = User.find_by(username: session_params[:username])
        
        # if user && user.authenticate(params[:password]) || user && user.authenticate(params[:param][:password])
        if @user && @user.authenticate(session_params[:password])
            login!
            render json: { logged_in: true, user: @user, user_data: {profile: @user.profile, meals: @user.meals} }
        else
            render json: { status: 401, errors: ['Wrong Username or Password'] }
        end
    end

    # GET /logged_in
    def is_logged_in?
        if logged_in? && current_user
            render json: {logged_in: true, user: current_user, user_data: {profile: current_user.profile, meals: current_user.meals}}
        else
            render json: {logged_in: false, message: ['No Such User']}
        end
    end


    # DELETE /logout
    def destroy
        if session[:user_id]
            # logout!
            session.destroy
            render json: {status: 200, logged_out: true}
        end
    end

    private 

        def session_params
            params.require(:user).permit(:username, :password)
        end
end
