namespace :db do
  desc 'Seed the database with fake data'
  task :seed => :settings do |t, args|
    require 'sequel'
    require 'sequel/extensions/seed'
    require './config/initializers/db'

    seed_path = File.expand_path('../../db/seeds', __dir__)
    DB = Sequel.connect(Settings.db.url || Settings.db.to_hash)
    
    Sequel.extension :seed
    Sequel::Seed.setup :development

    Sequel::Seeder.apply(DB, seed_path)
    p 'Seed was successfully added'
  end
end
