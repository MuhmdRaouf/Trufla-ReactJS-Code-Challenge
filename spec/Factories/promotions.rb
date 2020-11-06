FactoryBot.define do
  factory :promotion do
    sequence(:code) { |n| "code#{n}" }
    discount { 10 }
  end
end
