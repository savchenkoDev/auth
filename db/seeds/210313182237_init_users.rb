require './app/models/user'
Sequel.seed do # Wildcard Seed; applies to every environment
  def run
    [
      {email: 'first@email.com', name: 'first', password: '123123123'},
      {email: 'second@email.com', name: 'second', password: '123123123'},
      {email: 'third@email.com', name: 'third', password: '123123123'}
    ].each do |attrs|
      User.create attrs
    end
  end
end