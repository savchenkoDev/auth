require 'sinatra/custom_logger'

class Application < Sinatra::Base
  helpers Validations
  helpers Sinatra::CustomLogger

  configure do
    register Sinatra::Namespace
    register ApiErrors

    set :app_file, File.expand_path('../config.ru', __dir__)
  end

  configure :development do
    register Sinatra::Reloader

    set :show_exceptions, false
  end

  get '/' do
    json page_size: Settings.pagination.page_size
  end
end
