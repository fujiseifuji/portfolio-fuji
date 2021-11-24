FactoryBot.define do
  factory :map do
    id { "1" }
    address { "東京駅" }
    latitude { "35.6812" }
    longitude { "139.767" }
    created_at { '2021-01-01T00:00:00Z' }
    updated_at { '2021-01-02T00:00:00Z' }
    post_id { "1" }
  end
end
