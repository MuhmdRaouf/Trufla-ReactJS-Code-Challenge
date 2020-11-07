import axios from 'axios';

export const fetchProductsList = () => (
  axios.get('/api/v1/products')
    .then((response) => {
      return response;
    })
    .catch((error) => {
      return error;
    })
)

export const fetchProduct = (id) => (
  axios.get(`/api/v1/products/${id}`)
    .then((response) => {
      return response
    })
    .catch((error) => {
      return error;
    })
)
