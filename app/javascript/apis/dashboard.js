import axios from 'axios';

export const fetchDashboardDataset = (department, promotion) => (
  axios.get('api/v1/dashboard', { params: { department, promotion } })
    .then((response) => {
      return response;
    })
    .catch((error) => {
      return error;
    })
)

