FactoryBot.define do
  factory :post do
    id { "1" }
    caption { "公園があります。" }
    user_id { "1" }
    created_at { '2021-01-01T00:00:00Z' }
    updated_at { '2021-01-02T00:00:00Z' }
  end
end
