RSpec.describe UserSessionRoutes, type: :routes do
  describe 'POST /v1' do
    context 'missing parameters' do
      it 'returns an error' do
        post '/v1', { email: 'bob@example.com', password: nil }

        expect(last_response.status).to eq 422
      end
    end

    context 'invalid parameters' do
      let(:user) { build :user}
      it 'returns an error' do
        post '/v1', {email: user.email, password: 'givemeatoken'}

        aggregate_failures do
          expect(last_response.status).to eq 403
          expect(response_body['errors']).to include('detail' => 'Сессия не может быть создана')
        end
      end
    end

    context 'valid parameters' do
      let(:token) { 'jwt_token' }

      before do
        create(:user, email: 'bob@example.com', password: 'givemeatoken')

        allow(JWT).to receive(:encode).and_return(token)
      end

      it 'returns created status' do
        post '/v1', { email: 'bob@example.com', password: 'givemeatoken' }
        
        aggregate_failures do
          expect(last_response.status).to eq 201
          expect(response_body['meta']).to eq('token' => token)
        end
      end
    end
  end
end
