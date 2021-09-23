class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles
  def index
    @profile = Profile.all

    render json: @profile
  end

  # GET /users/1/profile
  def show
    render json: { profile: set_user.profile }
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    byebug
    if @profile.save
      # login!
      render json: { profile_created: true, profile: @profile }
    else
      render json: { status: 401, errors: ['Profile not created']}
    end
  end

  # PATCH/PUT user/1/profile
  def update
    if @profile.update(profile_params)
      render json: { profile_updated: true, profile: current_user.profile }
    else
      render json: {status: 401, errors: ['Profile not edited']}
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :age, :current_weight, :target_weight, :calories, :allergies, :diet, :user_id)
    end
end
