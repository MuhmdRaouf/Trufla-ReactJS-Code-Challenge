import React from "react";
import Select from "@material-ui/core/Select";
import MenuItem from "@material-ui/core/MenuItem";
import TextField from "@material-ui/core/TextField";
import {makeStyles} from "@material-ui/core/styles";
import InputLabel from "@material-ui/core/InputLabel";
import FormControl from "@material-ui/core/FormControl";


const useStyles = makeStyles((theme) => ({
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
  }
}));

export const SearchBar = ({ departments, promotions, selectedDepartment, setSelectedDepartment, selectedPromotions, setSelectedPromotions, productTextSearch, setProductTextSearch}) => {
  const classes = useStyles();
  const handleChange = (event, filterSetter) => {
    filterSetter(event.target.value);
  };

  return (
    <div className="offset-2 col-8 d-inline-flex justify-content-around">
      <FormControl className={classes.formControl}>
        <InputLabel id="demo-simple-select-label">Department</InputLabel>
        <Select
          id="department-select"
          value={selectedDepartment}
          onChange={(event) => { handleChange(event, setSelectedDepartment) }}
        >
          <MenuItem value="">All Department</MenuItem>
          {
            departments.map((department) => <MenuItem key={department.id} value={department.id}>{ department.name }</MenuItem>)
          }
        </Select>
      </FormControl>
      <FormControl className={classes.formControl}>
        <InputLabel id="demo-simple-select-label">Promotions</InputLabel>
        <Select
          id="promotions-select"
          value={selectedPromotions}
          onChange={(event) => { handleChange(event, setSelectedPromotions) }}
        >
          <MenuItem value="">All Promotions</MenuItem>
          {
            promotions.map((promotion) => <MenuItem key={promotion.id} value={promotion.id}>{ promotion.code }</MenuItem>)
          }
        </Select>
      </FormControl>
      <FormControl className={classes.formControl}>
        <TextField
          label="Search field"
          type="search"
          value={productTextSearch}
          onChange={(event) => { handleChange(event, setProductTextSearch) }}
        />
      </FormControl>
    </div>
  )
}
