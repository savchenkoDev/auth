require 'sinatra/extension'

module ApiErrors
  extend Sinatra::Extension

  helpers do
    def error_response(error_messages)
      errors = case error_messages
      when Sequel::Model
        ErrorSerializer.from_model(error_messages)
      else
        ErrorSerializer.from_messages(error_messages)
      end

      json errors
    end
  end

  error Sequel::NoMatchingRow do
    status 404
    error_response I18n.t(:not_found, scope: 'api.errors')
  end

  error Sequel::UniqueConstraintViolation do
    status 422
    error_response I18n.t(:not_unique, scope: 'api.errors')
  end

  error Validations::InvalidParams, KeyError do
    status 422
    error_response I18n.t(:missing_parameters, scope: 'api.errors')
  end
end
