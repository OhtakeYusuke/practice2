FactoryBot.define do
  factory :post do
    name {Faker::Name.name}
    description {Faker::Lorem.paragraph}
    user
  end
end
