import axios from 'axios';

export const fetchDashboardDataset = (department, promotion, page) => (
  axios.get('api/v1/dashboard', { params: { department, promotion, page } })
    .then((response) => {
      return response;
    })
    .catch((error) => {
      return error;
    })
)

