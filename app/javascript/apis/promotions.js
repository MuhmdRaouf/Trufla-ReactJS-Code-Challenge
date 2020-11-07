import axios from 'axios';

export const fetchPromotionsList = () => (
  axios.get('/api/v1/promotions')
    .then((response) => {
      return response;
    })
    .catch((error) => {
      return error;
    })
)

export const fetchPromotion = (id) => (
  axios.get(`/api/v1/promotions/${id}`)
    .then((response) => {
      return response
    })
    .catch((error) => {
      return error;
    })
)
