RSpec.describe Users::CreateService do
  subject { described_class }
  let(:email) { 'bob1@example.com' }

  context 'valid parameters' do
    let(:params) { {name: 'bob', email: email, password: 'givemeatoken'} }
  
    context 'email already exists' do
      before { create :user, email: email }
      
      it 'user was not created' do
        expect { subject.call(params) }.not_to change(User, :count)
      end
    end

    context 'email not exists' do
      let(:email) { 'test@email.com' }
      
      it 'user was not created' do
        expect { subject.call(params) }.to change(User, :count).by(1)
      end
    end
  end

  context 'invalid parameters' do
    let(:params) { {name: 'bob', email: email, password: ''} }

    it 'does not create user' do
      expect { subject.call(params) }
        .not_to change { User.count }
    end

    it 'assigns user' do
      result = subject.call(params)

      expect(result.user).to be_kind_of(User)
    end
  end
end
