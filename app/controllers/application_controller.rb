class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render status: 404, json: {error: exception.message}
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render status: 400, json: {error: exception.record.errors}
  end

  rescue_from ActiveRecord::StatementInvalid do |exception|
    render status: 400, json: {error: exception.message}
  end

  rescue_from ActiveRecord::RecordNotDestroyed do |exception|
    render status: 400, json: {error: exception.message}
  end
end
