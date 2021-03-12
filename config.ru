require_relative 'config/environment'

map '/' do
  run Application
end

map '/signup' do
  run UserRoutes
end

map '/signin' do
  run UserSessionRoutes
end