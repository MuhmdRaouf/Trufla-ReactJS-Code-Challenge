import _ from "lodash";

export const  organizeDataset = (department, product, promotionsList) => {
  const dataset = {
    department_id: department.id,
    name: department.name,
    id: product.id,
    product: product.name,
    price: product.price
  }
  return promotionsList.filter((promotion) => promotion.active)
                       .map((promotion) => ({
                         ...dataset,
                         promotion_id: promotion.id,
                         promotion: promotion.code,
                         discount: promotion.discount
                       }));
};

export const filterDataset = (filters, dataset) => {
  if (filters.selectedDepartment) {
    dataset = _.filter(dataset, (element) => (
      element.department_id === filters.selectedDepartment
    ))
  }
  if (filters.selectedPromotions) {
    dataset = _.filter(dataset, (element) => (
      element.promotion_id === filters.selectedPromotions
    ))
  }
  return dataset
};

