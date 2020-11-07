import axios from 'axios';

export const fetchDepartmentsList = () => (
  axios.get('/api/v1/departments')
    .then((response) => {
      return response;
    })
    .catch((error) => {
      return error;
    })
)

export const fetchDepartment = (id) => (
  axios.get(`/api/v1/departments/${id}`)
    .then((response) => {
      return response
    })
    .catch((error) => {
      return error;
    })
)
