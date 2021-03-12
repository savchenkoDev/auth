RSpec.describe UserSessions::CreateService do
  subject { described_class }
  let!(:user) { create(:user) }
  let(:params) { {email: user.email, password: 'givemeatoken'} }

  context 'valid parameters' do
    it 'creates a new session' do
      subject.call(params)

      expect(user.sessions.count).to eq(1)
    end

    it 'assigns session' do
      result = subject.call(params)

      expect(result.session).to be_kind_of(UserSession)
    end
  end

  context 'missing user' do
    let!(:user) { build(:user) }

    it 'does not create session' do
      expect { subject.call(params) }
        .not_to change { UserSession.count }
    end

    it 'adds an error' do
      result = subject.call(params)

      expect(result).to be_failure
      expect(result.errors).to include('Сессия не может быть создана')
    end
  end

  context 'invalid password' do
    let(:params) { {email: user.email, password: 'invalid'} }

    it 'does not create session' do
      expect { subject.call(params) }
        .not_to change { UserSession.count }
    end

    it 'adds an error' do
      result = subject.call(params)

      expect(result).to be_failure
      expect(result.errors).to include('Сессия не может быть создана')
    end
  end
end
