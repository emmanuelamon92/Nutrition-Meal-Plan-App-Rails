class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    before_action :authorize

    private

    def invalid_record(e)
        render json: {errors: e.record.errors.full_messages}, status: 400
      end 
    
    def authorize
        if !session[:user_id]
            render json: { errors: ["Must be logged in to see projects!"]}
        else
            @current_user = User.find(session[:user_id])
        end
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
