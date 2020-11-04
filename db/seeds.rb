# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DEPARTMENT_ATTRIBUTES = [
    { name: "Development"},
    { name: "HR"},
    { name: "Marketing"},
    { name: "Sales"}
].each do |attributes|
  Department.find_or_create_by(attributes)
end

PRODUCTS_ATTRIBUTES = [
    { name: "Development First Product", price: "10", department: Department.find_by(name: "Development") },
    { name: "Development Second Product", price: "25", department: Department.find_by(name: "Development") },
    { name: "Development Third Product", price: "60", department: Department.find_by(name: "Development") },
    { name: "Development Fourth Product", price: "85", department: Department.find_by(name: "Development") },
    { name: "HR First Product", price: "10", department: Department.find_by(name: "HR") },
    { name: "HR Second Product", price: "25", department: Department.find_by(name: "HR") },
    { name: "HR Third Product", price: "60", department: Department.find_by(name: "HR") },
    { name: "HR Fourth Product", price: "85", department: Department.find_by(name: "HR") },
    { name: "Marketing First Product", price: "10", department: Department.find_by(name: "Marketing") },
    { name: "Marketing Second Product", price: "25", department: Department.find_by(name: "Marketing") },
    { name: "Marketing Third Product", price: "60", department: Department.find_by(name: "Marketing") },
    { name: "Marketing Fourth Product", price: "85", department: Department.find_by(name: "Marketing") },
    { name: "Sales First Product", price: "10", department: Department.find_by(name: "Sales") },
    { name: "Sales Second Product", price: "25", department: Department.find_by(name: "Sales") },
    { name: "Sales Third Product", price: "60", department: Department.find_by(name: "Sales") },
    { name: "Sales Fourth Product", price: "85", department: Department.find_by(name: "Sales") }
].each do |attributes|
  Product.find_or_create_by(attributes)
end

PROMOTIONS_ATTRIBUTES = [
    { code: "code-10", active: true, discount: 10 },
    { code: "code-20", active: false, discount: 20 },
    { code: "code-25", active: true, discount: 25 },
    { code: "code-30", active: false, discount: 30 },
    { code: "code-50", active: true, discount: 50 },
    { code: "code-70", active: true, discount: 70 },
    { code: "code-90", active: false, discount: 90 },
].each do |attributes|
  Promotion.find_or_create_by(attributes)
end

PRODUCTS_PROMOTIONS_ATTRIBUTES = [
    { promotion: Promotion.find_by(code: "code-10"), product: Product.find_by(name: "Development First Product") },
    { promotion: Promotion.find_by(code: "code-20"), product: Product.find_by(name: "HR First Product") },
    { promotion: Promotion.find_by(code: "code-20"), product: Product.find_by(name: "Marketing First Product") },
    { promotion: Promotion.find_by(code: "code-25"), product: Product.find_by(name: "Sales First Product") },
    { promotion: Promotion.find_by(code: "code-30"), product: Product.find_by(name: "Development Second Product") },
    { promotion: Promotion.find_by(code: "code-50"), product: Product.find_by(name: "HR Second Product") },
    { promotion: Promotion.find_by(code: "code-70"), product: Product.find_by(name: "Marketing Second Product") },
    { promotion: Promotion.find_by(code: "code-90"), product: Product.find_by(name: "Sales Second Product") },
    { promotion: Promotion.find_by(code: "code-10"), product: Product.find_by(name: "Development Third Product") },
    { promotion: Promotion.find_by(code: "code-20"), product: Product.find_by(name: "HR Third Product") },
    { promotion: Promotion.find_by(code: "code-20"), product: Product.find_by(name: "Marketing Third Product") },
    { promotion: Promotion.find_by(code: "code-25"), product: Product.find_by(name: "Sales Third Product") },
    { promotion: Promotion.find_by(code: "code-30"), product: Product.find_by(name: "Development Fourth Product") },
    { promotion: Promotion.find_by(code: "code-50"), product: Product.find_by(name: "HR Fourth Product") },
    { promotion: Promotion.find_by(code: "code-70"), product: Product.find_by(name: "Marketing Fourth Product") },
    { promotion: Promotion.find_by(code: "code-90"), product: Product.find_by(name: "Sales Fourth Product") },
].each do |attributes|
  ProductPromotion.find_or_create_by(attributes)
end
