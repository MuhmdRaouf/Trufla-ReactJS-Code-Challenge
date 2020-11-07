import React, { useEffect, useState } from "react";
import { DataGrid } from '@material-ui/data-grid';
import { makeStyles } from '@material-ui/core/styles';

import { SearchBar } from "./SearchBar";
import { fetchPromotionsList } from "../apis/promotions"
import { fetchDashboardDataset } from "../apis/dashboard"
import { fetchDepartmentsList } from "../apis/departments"

const useStyles = makeStyles(() => ({
  table: {
    height: 400,
    width: '100%'
  }
}));


export const Dashboard = () => {
  const classes = useStyles();
  const [dataset, setDataset] = useState([]);
  const [departments, setDepartments] = useState([]);
  const [promotions, setPromotions] = useState([]);
  const [selectedDepartment, setSelectedDepartment] = useState("");
  const [selectedPromotions, setSelectedPromotions] = useState("");
  const [productTextSearch, setProductTextSearch] = useState("");
  const COLUMNS = [
    { field: 'id', headerName: 'ID', width: 75 },
    { field: 'department_name', headerName: 'Department', width: 150 },
    { field: 'name', headerName: 'Name', width: 150 },
    { field: 'price', headerName: 'Price', width: 150 },
    { field: 'promotion', headerName: 'Promotion', width: 150 },
    { field: 'discount', headerName: 'Discount', width: 150 },
    { field: 'is_active', headerName: 'Active', width: 150 }
  ];

  const searchFilter = (element) => (
    productTextSearch ? element.name.toLowerCase().includes(productTextSearch.toLowerCase()) : true
  )

  useEffect(() => {
    fetchDashboardDataset(selectedDepartment, selectedPromotions)
      .then((response) => {
        setDataset(response.data);
      }).catch((error) => {})
  }, [selectedDepartment, selectedPromotions])

  useEffect(() => {
    fetchDepartmentsList()
      .then((response) => {
        setDepartments(response.data);
      }).catch((error) => {})
  }, [])

  useEffect(() => {
    fetchPromotionsList()
      .then((response) => {
        setPromotions(response.data);
      }).catch((error) => {})
  }, [])

  return (
    <div className="container">
     <div className="row">
       <SearchBar
         departments={departments}
         promotions={promotions}
         selectedDepartment={selectedDepartment}
         setSelectedDepartment={setSelectedDepartment}
         selectedPromotions={selectedPromotions}
         setSelectedPromotions={setSelectedPromotions}
         productTextSearch={productTextSearch}
         setProductTextSearch={setProductTextSearch}
       />
       <div className="offset-2 col-8">
         <div className={classes.table}>
           <DataGrid rows={dataset.filter(searchFilter)} columns={COLUMNS} pageSize={5} />
         </div>
       </div>
     </div>
    </div>
  )
};
