FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "fake#{i}@fake.com" }
  end
end
