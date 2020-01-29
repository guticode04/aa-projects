FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password{ "1234567"}
    end
end