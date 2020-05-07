FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "fake#{i}@fake.com" }
    password { "1234567" }
  end
end
