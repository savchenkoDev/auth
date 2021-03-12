DatabaseCleaner[:sequel].strategy = :deletion

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner[:sequel].clean
  end

  config.after :each do
    DatabaseCleaner[:sequel].start
  end
end
