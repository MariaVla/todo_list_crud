class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActionController::UnknownFormat, with: :raise_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotSaved, with: :record_not_saved

  def raise_not_found
    raise ActionController::RoutingError.new('Not supported format')
  end
  
  def record_not_found
    render json: { message: "Record not found." }, status: :not_found
  end

  def record_not_saved
    render json: { message: "Record not saved." }, status: :unprocessable_entity
  end
end
