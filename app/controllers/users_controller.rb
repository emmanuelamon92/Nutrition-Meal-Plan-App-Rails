class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize, only: [:create]
  wrap_parameters :user, include: [:username, :password, :password_confirmation]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    if @user
       render json: { user: @user }
    else
       render json: { status: 500, errors: ['user not found'] }
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      Profile.create(name: "", age: 0, current_weight: 0, target_weight: 0, calories: 0, allergies: "", diet: "", user_id: @user.id)
      login!
      render json: {status: :created, user: @user, user_data: user_data}

    else
      render json: @user.errors, status: 500, message: ['User Not Created']

    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
