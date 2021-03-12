FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Name#{n}" }
    sequence(:email) { |n| "test#{n}@email.com" }
    password { 'givemeatoken' }
  end
end
