import React, {useEffect, useState} from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Pagination from '@material-ui/lab/Pagination';

import { Card } from "./Card";
import { SearchBar } from "./SearchBar";
import { fetchPromotionsList } from "../apis/promotions";
import { fetchDashboardDataset } from "../apis/dashboard";
import { fetchDepartmentsList } from "../apis/departments";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  paginator: {
    marginTop: theme.spacing(2),
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
  const [page, setPage] = useState(1);
  const [totalPageCount, setTotalPageCount] = useState(0);

  const searchFilter = (element) => (
    productTextSearch ? element.name.toLowerCase().includes(productTextSearch.toLowerCase()) : true
  )

  const handleChangePage = (element, value) => (
    setPage(value)
  )

  useEffect(() => {
    fetchDashboardDataset(selectedDepartment, selectedPromotions, page)
      .then((response) => {
        setDataset(response.data.dashboard_products);
        setTotalPageCount(response.data.total_pages_count);
      }).catch((error) => {})
  }, [selectedDepartment, selectedPromotions, page])

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
    <Grid container justify="center" className={classes.root} spacing={2}>
      <Grid item xs={12}>
        <Grid container justify="center" spacing={2}>
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
        </Grid>
      </Grid>
      <Grid item xs={12}>
        <Grid container justify="center" spacing={6}>
          {
            dataset.filter(searchFilter).map((element) => (
              <Card key={element.id} card_data={ element } />
            ))
          }
        </Grid>
      </Grid>
      <Grid item xs={12}>
        <Grid container justify="center" className={classes.paginator} spacing={2}>
          <Pagination
            count={totalPageCount}
            color="primary"
            page={page}
            onChange={handleChangePage}
          />
        </Grid>
      </Grid>
    </Grid>
  );
}
