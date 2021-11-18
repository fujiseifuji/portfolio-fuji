FactoryBot.define do
  factory :photo do
    id { "1" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.png'), 'image/png') }
    created_at { '2021-01-01T00:00:00Z' }
    updated_at { '2021-01-02T00:00:00Z' }
    post_id { "1" }
  end
end
