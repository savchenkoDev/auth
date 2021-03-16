FactoryBot.definition_file_paths = %w{./factories ./test/factories ./spec/factories}

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do 
    FactoryBot.find_definitions
  end
end

FactoryBot.use_parent_strategy = false
FactoryBot.to_create { |i| i.valid? ? i.save : i.errors }