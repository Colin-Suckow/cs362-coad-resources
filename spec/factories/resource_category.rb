FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |i| "FAKE#{i}" }
  end
end
