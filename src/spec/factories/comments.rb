FactoryBot.define do
  factory :comment do
    association :post
    association :user
    user { post.user }
    id { "1" }
    comment { "いいですね" }
    created_at { '2021-01-01T00:00:00Z' }
    updated_at { '2021-01-02T00:00:00Z' }
  end
end
