FactoryBot.define do
  factory :user do
    id { "1" }
    name { "testuser" }
    email { "test@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    created_at { '2021-01-01T00:00:00Z' }
    updated_at { '2021-01-02T00:00:00Z' }
    profile_photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'image/jpeg') }
  end
end
