class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

private
  def render_not_found(error)
    render json: { error: error.message}, status: :not_found
  end

  def render_invalid(error)
    render json: {errors: error.record.errors.full_messages}, status: :unprocessable_entity
  end
end
