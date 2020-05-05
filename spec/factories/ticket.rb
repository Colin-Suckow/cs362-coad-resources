FactoryBot.define do
  factory :ticket do
    name { "FAKE" }
    phone { " +61 412 345 678 " }
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }
  end
end
