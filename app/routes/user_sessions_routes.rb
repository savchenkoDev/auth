class UserSessionRoutes < Application
  namespace '/v1' do
    post do
      session_params = validate_with!(SessionParamsContract)
      result = UserSessions::CreateService.call(email: session_params[:email], password: session_params[:password])

      if result.success?
        token = JwtEncoder.encode(uuid: result.session.uuid)
        response = {meta: { token: token }}

        status 201
        json response
      else
        status 403 
        error_response(result.session || result.errors)
      end
    end
  end
end