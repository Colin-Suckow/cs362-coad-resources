FactoryBot.define do
    factory :region do
        sequence(:name) { |i| "FAKE#{i}" }
    end
end