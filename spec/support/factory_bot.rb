FactoryBot.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryBot.find_definitions
FactoryBot.to_create { |i| i.valid? ? i.save : i.errors }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
