FactoryBot.define do
  factory :user do
    id { "1" }
    name { "testuser" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    created_at { '2021-01-01T00:00:00Z' }
    updated_at { '2021-01-02T00:00:00Z' }
    profile_photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.png'), 'image/png') }
  end
end
