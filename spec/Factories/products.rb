FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "product#{n}" }
    price { 10 }
    department
  end
end
