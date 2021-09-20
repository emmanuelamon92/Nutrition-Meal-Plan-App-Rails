class MealsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /meals
  def index
    @meals = Meal.all

    render json: @meals
  end

  # GET /mymeals
  def show
    # byebug
    render json: set_user.meals
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)
    # byebug
    if @meal.save
      # login!
      render json: { meal_created: true, meal: @meal }
    else
      render json: { status: 401, errors: ['Meal not created']}
    end
  end

  # PATCH/PUT /meals/1
  def update
    byebug
    if @meal.update(meal_params)
      render json: { meal_updated: true, meal: @meal }
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:title, :readyInMinutes, :servings, :sourceUrl, :favorite, :user_id)
    end
end
