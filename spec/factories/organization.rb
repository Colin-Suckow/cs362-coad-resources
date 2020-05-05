FactoryBot.define do
  factory :organization do
    sequence(:email) { |i| "fake#{i}@fake.com" }
    sequence(:name) { |i| "FAKE#{i}" }
    phone { "12345678" }
    status { "submitted" }
    primary_name { "FAKE" }
    secondary_name { "FAKE2" }
    secondary_phone { "87654321" }
  end
end
