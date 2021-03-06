class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: lambda { |e| handle_not_found_error(e) }
  rescue_from ActiveRecord::RecordInvalid, with: lambda { |e| handle_validation_error(e) }

  def handle_not_found_error(error)
    mapped = {
      errors: [
        title: 'Record not Found',
        status: "404",
        detail: 'We could not find the object you were looking for.',
        source: { pointer: '/request/url/:id' }
      ]
    }
    render json: mapped, status: :not_found
  end

  def handle_validation_error(error)
    all_errors = map_validation_error(error.record.errors)
    mapped = {
      errors: all_errors
    }
    render json: mapped, status: :unprocessable_entity
  end

  def map_validation_error(errors)
    errors_array = []
    errors.each do |error|
      errors_array << {
        status: "422",
        title: "invalid request",
        detail: error.message,
        source: { pointer: "/data/attributes/#{error.attribute}" }
      }
    end
    errors_array
  end
end
