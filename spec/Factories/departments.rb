FactoryBot.define do
  factory :department do
    sequence(:name) { |n| "department#{n}" }

    # department_with_products will create product data after the department has been created
    factory :department_with_products do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        products_count { 5 }
      end

      # the after(:create) yields two values; the department instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the product
      after(:create) do |department, evaluator|
        create_list(:product, evaluator.products_count, department: department)
      end
    end
  end
end
