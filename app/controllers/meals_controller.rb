class MealsController < ApplicationController
  # before_action :set_meal, only: [:show, :update, :destroy]
  wrap_parameters :meal, include: [:title, :readyInMinutes, :servings, :sourceUrl, :favorite, :user_id]

  # GET /meals
  def index
    @meals = Meal.all

    render json: @meals
  end

  # GET /mymeals
  def show
    render json: set_user.meals
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      render json: { meal_created: true, meal: @meal, meals: current_user.meals }
    else
      render json: { status: 401, errors: ['Meal not created']}
    end
  end

  # PATCH/PUT /meals/1
  def update
    # byebug
    if @meal.update(meal_params)
      render json: { meal_updated: true, meal: @meal }
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    @meals = current_user.meals
    if @meals
      @meals.destroy_all
      render json: { status: 200, meals_destroyed: true, meals: current_user.meals }
    else
      render json: { status: 401, errors: ['Meal not deleted']}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_meal
    #   @meal = Meal.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:title, :readyInMinutes, :servings, :sourceUrl, :favorite, :user_id)
    end
end
