require_relative 'config/environment'

run Rack::URLMap.new(
  '/v1/signup' => UserRoutes,
  '/v1/signin' => UserSessionRoutes,
  '/v1/auth' => AuthRoutes
)